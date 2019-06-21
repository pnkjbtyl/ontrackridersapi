var emvalidator = require("email-validator");
var express=require("express");
var router = express.Router();
var nodemailer = require('nodemailer');
var generator = require('generate-password');
var config = require('./../config');
var bcrypt=require('bcrypt')
var dateTime = require('node-datetime');
var dt = dateTime.create();

var String = generator.generate({
  length:8,
  numbers:true
});
var String1 = generator.generate({
  length:32,
  numbers:true
});

router.post('/password',function(req,res,next){
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

router.put('/password',function(req,res){
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