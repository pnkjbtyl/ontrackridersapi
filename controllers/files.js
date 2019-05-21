var express=require("express");
var bodyParser=require('body-parser');
var express=require("express");
var router = express.Router();
var path=require('path');
var multer=require('multer');
var dateTime = require('node-datetime');
var dt = dateTime.create();
var formatted = dt.format('Y-m-d H:M:S');

var connection = require('../config');
//-------------------------------------------------------//
//--------------------UPLOAD IMAGE-----------------------//
//-------------------------------------------------------//
filename=[5];
var storage = multer.diskStorage({
 destination: function (req, file, callback) {
  callback(null, './controllers/uploads');
 },
 filename: function (req, file, callback) {
  fileoriginalname=[]; 
  fileoriginalname=file.originalname;
  filename= Date.now() + "_" + file.originalname
  var date=Date.now();
  var file_data={
   "user_id":req.decoded.id,
   "file_name":fileoriginalname ,
   "fs_name":filename,
   "created_at":formatted,
   "updated_at":formatted,
    "is_deleted":'0' 
  }
  global.ids = [];
  console.log(file);
  connection.query('INSERT INTO rider_files SET ?',[file_data], function (error, result, fields) {
    if(error)
      console.log("Error"+error)
    else
      global.ids.push(result.insertId);
  })
  callback(null, filename);

  return (filename);
 }
});
const upload= multer({
 storage:storage
}).array("files",5);

router.post("/uploads", function (req, res) {

 upload(req, res, function (err) {
  if (err) {
   res.status(400).json({
    message:err.message     
   })
  }else{
    if (err) {
     console.log("Error"+ err);
     res.status(400).json({
      message:err.message
     })
    }
    else{
     console.log("File Uploaded ")
     res.status(200).json({
      data:{    
       fileoriginalname,
       filename
      },
      message:"File Uploaded Succesfully"
     })
    }
   }
 });
});
  

//-------------------------------------------------------//
//--------------------FETCH IMAGE-----------------------//
//-------------------------------------------------------//

router.get("/files",function(req,res){
  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 connection.query('SELECT id,file_name,fs_name FROM rider_files WHERE user_id = ?',[req.decoded.id], function (error, data, fields) {
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
     message:"No data for this id."
    });
   }
  }  
 });
})

router.get("/setprofilepic/:id",function(req,res){
  profileid=req.params.id
  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 connection.query('SELECT * FROM rider_files WHERE id = ?',profileid, function (error, data, fields) {
  if(error){
   res.status(400).json({
    message:"Error found " +error
   })
  }
  
  else{
   if(data.length){
    connection.query('UPDATE rider_users SET profile_pic=? WHERE id="'+req.decoded.id+'"',[data[0].fs_name], function (error, results, fields) {
     if(error){
      res.status(400).json({
        message:error.message
      }) 
     }
     else{ 
      res.sendFile(path+data[0].fs_name)
     }
    });
   }
   else{
    res.status(403).json({
     message:"No data found for this id."
    });
   } 
  }  
 });
})


module.exports=router;