var express=require('express');
var formidable= require('express-formidable');
var router=express.Router();
var emvalidator = require("email-validator");
var generator = require('generate-password');
var bcrypt=require('bcrypt')
const jwt = require('jsonwebtoken');
var config = require('../config');
var bcrypt=require('bcrypt')
var dateTime = require('node-datetime');
var dt = dateTime.create();
var emvalidator = require("email-validator");
var nodemailer = require('nodemailer');

const tokenList={};

//================Rerfresh token======================//
router.get('/refreshtoken',function(req,res){
  var refreshSecretKey = req.headers['refresh-token'];
  var decoded = jwt.verify(refreshSecretKey, 'refreshsecretkey');
  
  if(decoded.email){

   var email = decoded.email;
   config.connection.query('SELECT * FROM rider_users WHERE email = ?',[decoded.email],function (error,results,fields){
   if(results.length>0){

    //check if email exists in db

    const token = jwt.sign({email}, 'secretkey', { expiresIn: 24 * 60 * 60 })
    const refreshSecretKey=jwt.sign({email}, 'refreshsecretkey', { expiresIn: 24 * 60 * 60 * 365 })// (err, token) => {

     res.status(200).json({
      data:{
       email:email,
       token,
       refreshSecretKey
      },
      message:'Login Successful',
      })
   }else{
      res.status(400).json({
        message:"Email doesn't exist"
      })
    }
   })
  }else{
    res.status(401).json({
      message:"Invalid token"
    });   
   }
})

 //================User Registration======================//
router.post('/signup',function(req,res){

  var String = generator.generate({
     length:32,
     numbers:true
  });
  
  var date=new Date();
  var users={ 
     "name":req.body.name,
     "email":req.body.email,
     "password":req.body.password+String,
     "salt":String,
     "created_at":date,
     "updated_at":date
  }
  var email=req.body.email;
  var password=req.body.password+String;
  if(!req.body.name || !req.body.email ||  !req.body.password){
       res.status(422).json({
            message:"Please insert values for all fields",
     })    
   }else{
     config.connection.query('SELECT * FROM rider_users WHERE email = ?',[email],function (error,results,fields){
       if (error) {
         res.status(400).json({
             message:'there is some error with query'
         })
       }else if(results.length){
         if(email==results[0].email){
           res.status(409).json({
               message:'Email already exist'
           })
         }
       }else if(!emvalidator.validate(users.email)){
         res.status(422).json({
           message:'email is invalid'
       })
       }else{
       
         bcrypt.hash(users.password,2, function(err, hash) {
           users.password=hash;
           config.connection.query('INSERT INTO rider_users SET ?',users, function (error, results, fields) {
             if (error) {
               console.log("Error"+ error);
               res.status(400).json({
                   message:'there is some error with query' +error,
                   
               })
             }else{
               id=results.insertId;
               user_email=users.email;
               const token= jwt.sign({user_email,id}, 'secretkey', { expiresIn: 24 * 60 * 60 })
               const refreshtoken=jwt.sign({user_email}, 'refreshsecretkey', { expiresIn: 24 * 60 * 60 *365 })
               const response = {
                 "status": "Registered",
                 "token": token,
                 "refreshToken": refreshtoken,
                 } 
                 tokenList[refreshtoken] = response
                   res.status(200).json({
                     data:{
                       id,
                       name:users.name,
                       email:users.email,
                       token,
                       refreshtoken
                          },
                     message:'Registered',
                   })
               }
             });
           });

       }
     }); 
     }
    // router.use(formidable());

})

//================User Login======================//
router.post('/login',function(req,res,){
 var email=req.body.email;
 module.exports.ex_email=email;
 if(!req.body.email || !req.body.password){
  res.status(422).json({
   message:"Please insert values for all fields",
  })
 }else{
   config.connection.query('SELECT * FROM rider_users WHERE email = ?',[email],function (error,results,fields){
    if (error) {
     console.log(error);
     res.status(400).json({
      message:'there are some error with query'
     });
    }else{
      if(results.length){
       name=results[0].name;
       salt=results[0].salt;
       id=results[0].id;
       var checkpswrd=req.body.password+salt;
       bcrypt.compare(checkpswrd, results[0].password, function(err, result) {        
        if(result){
         const token= jwt.sign({email,id,name}, 'secretkey', { expiresIn: 24 * 60 * 60 })
         const refreshtoken=jwt.sign({email}, 'refreshsecretkey', { expiresIn: 24 * 60 * 60 *365 })// (err, token) => {
         res.status(200).json({
          data:{
           name:name,
           email:email,
           token,
           refreshtoken
          },
          message:'Login Successfull',
         })
        }else{
          res.status(401).json({
           message:"Email and password does not match"
          });
         }
        });
      }else{
        res.status(403).json({   
         message:"Email does not exist"
        });
       }
     }
   });
  }
  //router.use(formidable());   
 
})

router.get("/files/:offset?",function(req,res){

  var offset = parseInt(req.params.offset) || 0;

  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 config.connection.query('SELECT id,file_name,fs_name FROM rider_files Limit ?, 10', [offset], function (error, data, fields) {
  if(error){
   res.status(400).json({
    message:"Error found " +error
   })
  }
  else{
   if(data.length){
    res.status(200).json({ 
     data:data
    }); 
   // res.sendFile(path.join(__dirname+"/uploads/"+data[0].fs_name))
   }
   else{
    res.json({
     message:"No data found"
    });
   }
  }  
 });
})



//---------------------------------------------------------//
//-------------------FORGET PASSWORD-----------------------//
//---------------------------------------------------------//


var String = generator.generate({
  length:8,
  numbers:true
});
var String1 = generator.generate({
  length:32,
  numbers:true
});

router.post('/forget/password',function(req,res,next){
 email=req.body.email;
 config.connection.query('SELECT name,email from rider_users WHERE email= "'+email+'"',function(req,results,fields){
  if(results.length==0){
   res.status(400).json({
    message:"Email doesn't exist"
   })
  }
  else{
   var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
     user: 'ontrack.testsa@gmail.com',
     pass: '9501828672'
    }
   });
   var mailOptions = {
    from: 'Riders App',
    to: email,
    subject: 'Reset Password',
    text: 'Thank You For Registering with us ' +results[0].name+'. ' +' Please use the below mentioned key to reset your password.' +"\n"
         +"\n" +'Key: ' +String +"\n" +"\n"
         +'Thanks and Regards'+"\n"
         +'Ontrack'
   }
   transporter.sendMail(mailOptions, function(error, info){
    if (error) {
     console.log("----------------"+error);
    }
    else {
     res.status(200).json({
      message: "Email has been sent to your registered email use they key to reset the password"
     })
    }
   })
  }       
 })  
})

//---------------------------------------------------------//
//-------------------RESET PASSWORD-----------------------//
//---------------------------------------------------------//

router.put('/reset/password',function(req,res){
 var email=req.body.email;  
 var key=req.body.key;
 var password=req.body.password;
 var confirm_password =req.body.confirm_password;
 
 if(!email || !key || !password || !confirm_password){
  res.status(422).json({
   message:'Insert value for all fields'
  })  
 }
 else if(key!=String){
  res.status(403).json({
   message:"Enter a valid key sent on your registered mail "+ email
  })
 }
 else if(password!=confirm_password){
  res.status(400).json({
   message:"Enter same value for both password field"
  })
 }
 else{
  var formatted = dt.format('Y-m-d H:M:S');
  var setpassword=password+String1;
  bcrypt.hash(setpassword,2, function(err, hash) {
   setpassword=hash;
   config.connection.query('UPDATE rider_users SET password=?, salt=?, updated_at=? WHERE email="'+email+'"',[setpassword,String1,formatted], function (error, results, fields) {
    if(error){
     res.status(400).json({
      message: error.message
     })
    }
    else{
     res.status(200).json({
       data:{
         email
       },
      message:'Password is reset  successfully'
     })
    }
   })
  })
 }   
})
module.exports=router;