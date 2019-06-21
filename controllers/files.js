var express=require("express");
var bodyParser=require('body-parser');
var express=require("express");
var router = express.Router();
var path=require('path');

var multer=require('multer');

var fs=require('fs');

var config = require('../config');


//-------------------------------------------------------//
//--------------------FETCH IMAGE-----------------------//
//-------------------------------------------------------//

router.get("/files",function(req,res){
  router.upload(function(req,res){
    if(req.url=='/files'){
      var form=new formidable.IncomingForm();
      form.parse(req, function(err,fields,files){
        res.end();
      })
    }
  })
  path=__dirname + "/uploads/"
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 config.connection.query('SELECT id,file_name,fs_name FROM rider_files WHERE user_id = ?',[req.decoded.id], function (error, data, fields) {
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


module.exports=router;