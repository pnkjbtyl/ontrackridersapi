var express=require("express");
var formidable= require('express-formidable');
var bodyParser=require('body-parser');
var router = express.Router();
var generator = require('generate-password');
var connection = require('../config');




router.use(bodyParser.urlencoded({extended:true}));
router.use(bodyParser.json());

router.use('/test',function(req,res){
 var date = new Date();
 var hour = date.getHours();
 var min= date.getMinutes();
 var sec= date.getSeconds();
 var time= hour+":" +min +":" +sec;
 var random = generator.generate({
  length:8,
  numbers:false
 });
 var server_name="ONTRACK SERVER"
 if (res.status(200)){
  res.json({
   message: 'Success',
   data: {
    Time:time,
    String:random,
    Server:server_name
   }
  })  
 }  
})

//-------------------------------------------------------//
//----------------------ADD VEHICLE---------------------//
//-------------------------------------------------------//


router.post('/add',function(req,res){
  user_id=req.decoded.id;
  console.log("ud" +user_id)
 var registration_no=req.body.registration_no;
 var vehicles={ 
   "user_id":user_id,
  "registration_no":req.body.registration_no,
  "registrant_name":req.body.registrant_name,
  "make":req.body.make,
  "vehicle_type":req.body.vehicle_type,
  "body_type":req.body.body_type,
  "model":req.body.model,
  "model_year":req.body.model_year,
  "color":req.body.color,
  "seat_capacity":req.body.seat_capacity,
  "engine_cc":req.body.engine_cc,
  "fuel_type":req.body.fuel_type,
  "interior":req.body.interior,
  "pets_allowed":req.body.pets_allowed,
  "music_allowed":req.body.music_allowed,
  "smoking_allowed":req.body.smoking_allowed 
 }
 if(!req.body.registration_no || !req.body.registrant_name ||  !req.body.make || !req.body.vehicle_type || !req.body.body_type ||
  !req.body.model|| !req.body.model_year|| !req.body.color|| !req.body.seat_capacity|| !req.body.engine_cc
  || !req.body.fuel_type || !req.body.interior || !req.body.pets_allowed|| !req.body.music_allowed || !req.body.smoking_allowed){
  res.status(422).json({
   message:"Please insert values for all fields",
  })    
 }else{
   connection.query('SELECT * FROM rider_vehicles WHERE registration_no = ?',[registration_no],function (error,results,fields){
    if (error) {
     res.status(400).json({
      message:'there are some error with query'
     })
    }
    else if(results.length>0){
     if(registration_no==results[0].registration_no){
      res.status(409).json({
       message:'This registration id already exist'
      })
     }
    }
    else{
     connection.query('INSERT INTO rider_vehicles SET ?',vehicles, function (error, data, fields) {
      if (error) {
       console.log("Error"+ error);
       res.status(400).json({
        message:'there are some error with query' +error,
       })
      }
     else{
      res.status(200).json({
       vehicles,
       message:'Vehicle added successfully',
      })
     }
     });
    }
   });
  }
})

//-------------------------------------------------------//
//--------------FETCH VEHICLE LIST BY USERID-------------//
//-------------------------------------------------------//


router.get('/:uid?',function(req,res){
var user_id = req.params.uid || req.decoded.id;
 connection.query('SELECT id,registration_no,make,model,model_year FROM rider_vehicles WHERE user_id = ?',[user_id],function (error,results,fields){
  if(error){
   res.status(400).json({
    message:"There is some error with the query"
   })
  }
  else if(results.length){
   res.status(200).json({
    data:results,
    message: results.length+" Records fetched successfully"
   })  
  }
  else{
   res.status(403).json({
    message:"Invalid userid"
   })  
  }  
 })
})

//-------------------------------------------------------//
//-----------FETCH VEHICLE DETAIL BY VEHICLE ID----------//
//-------------------------------------------------------//


router.get('/details/:id',function(req,res){
 
  console.log(req)
 
  var vehicle_id=req.params.id;
 if(!vehicle_id){
  res.status(422).json({
   message:"Please enter vehicle id"
  })
 }
 else{
  connection.query('SELECT * FROM rider_vehicles WHERE id = ?',[vehicle_id],function (error,results,fields){
   if(error){
    res.status().json({
     message:"There is some error with the query"
    })
   }
   else if(results.length){
    res.status(200).json({
     data:results[0],
     message: "Record fetched successfully"
    })  
   }
   else{
    res.status(403).json({
     message:"Invalid vehicle id "
    })  
   }
     
  })
 }
}) 
module.exports=router;