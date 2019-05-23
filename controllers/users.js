var express=require("express");
var bodyParser=require('body-parser');
var router = express.Router();
var connection = require('../config');
var path=require('path');
var multer=require('multer');
var _=require('underscore');
var dateTime = require('node-datetime');
var dt = dateTime.create();
var formatted = dt.format('Y-m-d H:M:S');
var formidable=require('formidable');
var fs=require('fs');
/*router.get('/', function(req,res){
    res.send('users.js file')
});*/

router.use(bodyParser.urlencoded({extended:true}));
router.use(bodyParser.json());

//-------------------------------------------------------//
//--------------UPDATE USER------------------------------//
//-------------------------------------------------------//
router.put('/update',function(req,res){
  var date=new Date();
  var update_details={ 
   "name":req.body.name,
   "age":req.body.age,
   "dob":req.body.dob,
   "location":req.body.location,
   "driving_licence":req.body.driving_licence,
   "identification_no":req.body.identification_no,
   "gender":req.body.gender,
   "blood_group":req.body.blood_group,
   "marital_status":req.body.marital_status,
   "smoke":req.body.smoke,
   "drink":req.body.drink,
   "spectacles":req.body.spectacles,
   "updated_at":date
  }
  var email=req.decoded.email;
  if(!req.body.name || !req.body.age || !req.body.dob || !req.body.location || !req.body.driving_licence||
   !req.body.identification_no || !req.body.gender || !req.body.blood_group || !req.body.marital_status || !req.body.smoke ||
   !req.body.drink|| !req.body.spectacles){
   res.status(422).json({
    message:"Please insert values for all fields",
   }) 
  }else{
    connection.query('UPDATE rider_users SET ? WHERE email="'+email+'"',[update_details], function (error, results, fields) {
     if (error) {
      console.log("Error"+ error);
      
      res.status(400).json({
       message:'there are some error with query' +error,
      })
     }else{
       res.status(200).json({
        data: update_details,
        message:'Successfully updated',
       }) 
      }
    });  
   
  }
})

router.get("/files/:uid?/:offset?",function(req,res){

  var offset = parseInt(req.params.offset) || 0;
  var uid = parseInt(req.params.uid) || req.decoded.id;

  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 connection.query('SELECT id,file_name,fs_name FROM rider_files WHERE user_id=? Limit ?, 10', [uid, offset], function (error, data, fields) {
  if(error){
   res.status(400).json({
    message:"Error found " +error
   })
  }
  else{
   if(data.length){
    connection.query('SELECT count(id) as total_records FROM rider_files', function (error, results, fields) {
      var total_records = results[0].total_records;
      res.status(200).json({
        data:{
          paged_records:data,
          offset: offset,
          total_records: total_records
        },
        message: data.length+" records fetched out of "+total_records+" records"
       });    
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

//-------------------------------------------------------//
//--------------FETCH CURRENT USER-----------------------//
//-------------------------------------------------------//
router.get('/:uid?',function(req,res){
 id=req.params.uid || req.decoded.id
 
 connection.query('SELECT * FROM rider_users WHERE id = ?',[id],function (error, results, fields) {
  if (error) {
   console.log(error)
   res.status(400).json({
    message:'There is some error with query'
   })
  }else if(results.length){
    delete results[0].salt;
    delete results[0].password;
    res.status(200).json({
     data:results[0],
     message:"Success"
    })
   }else{
     res.status(403).json({
      message:"User id doesn't exist"
     })
    }
 })
})

//-------------------------------------------------------//
//--------------------UPLOAD IMAGE-----------------------//
//-------------------------------------------------------//


router.post('/uploads', function (req, res){
  var form = new formidable.IncomingForm();
  form.filesdata=[];
  form.on('file', function (name, file){
    var fsFilename = Date.now()+'-'+file.name;
    var uploadPath = 'E:/NODE JS PPROJECTS/server/uploads/'+fsFilename;
    fs.copyFile(file.path, uploadPath, function(err){
      if(err) console.log(err);
    });
    var insert_id;
    var data = {
      "user_id":req.decoded.id,
      "file_name":file.name,
      "fs_name":fsFilename,
      "is_deleted":"0",
      "created_at":formatted,
      "updated_at":formatted
    };
    form.filesdata.push(data);
  });

  form.on('end', function (){
    _.each(form.filesdata, function(filejson, index, list){
        connection.fileIds = [];
        connection.query('INSERT INTO rider_files SET ?',[filejson], function (error, result, fields) {
          connection.fileIds.push(result.insertId);
          if(list.length == (index+1)){
            //Fetch files from DB and print result
            connection.query('SELECT * FROM rider_files WHERE id IN (?)',[connection.fileIds],function(err,results,fields){
              res.status(200).json({data:results, message: results.length+" records uploaded"}).end();
            });
          }
        });
    });
  });

  form.parse(req);
});


//-----------------------------------------------//
//-----------SET PROFILE PIC--------------------//
//---------------------------------------------//

router.get("/setprofilepic/:id",function(req,res){
  profileid=req.params.id
  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 connection.query('SELECT * FROM rider_files WHERE id = ?',profileid, function (error, profile_image, fields) {
  if(error){
   res.status(400).json({
    message:"Error found " +error
   })
  }
  
  else{
    if(profile_image[0].user_id==req.decoded.id){
   if(profile_image.length){
    connection.query('UPDATE rider_users SET profile_pic_id=? WHERE id="'+req.decoded.id+'"',[profile_image[0].id], function (error, results, fields) {
     if(error){
      res.status(400).json({
        message:error.message
      }) 
     }
     else{ 
      res.status(200).json({
        data:{
          profile_image
        },
        message:"Profile photo updated successfully"
      })
     }
    });
   }
   else{
    res.status(403).json({
     message:"No data found for this id."
    });
   }
  }
  else{
    res.status(403).json({
      message:'You are not authorized to access this data.'
    })
  } 
  }  
 });
})


module.exports=router;