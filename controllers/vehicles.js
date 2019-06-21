var express=require("express");
var formidable= require('express-formidable');
var bodyParser=require('body-parser');
var router = express.Router();
var generator = require('generate-password');
var config = require('../config');




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
   config.connection.query('SELECT * FROM rider_vehicles WHERE registration_no = ?',[registration_no],function (error,results,fields){
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
     config.connection.query('INSERT INTO rider_vehicles SET ?',vehicles, function (error, data, fields) {
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
 config.connection.query('SELECT id,registration_no,make,model,model_year FROM rider_vehicles WHERE user_id = ?',[user_id],function (error,results,fields){
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
  config.connection.query('SELECT * FROM rider_vehicles WHERE id = ?',[vehicle_id],function (error,results,fields){
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

//-------------------------------------------------------//
//--------------------SET VEHICLE IMAGES-----------------------//
//-------------------------------------------------------//
router.get("/setvehiclepic/:ids",function(req,res){
  var vehicleids=req.params.ids.split(",");
  path=__dirname + "/uploads/" 
  //filen="http://192.168.1.6:3000/";
  //res.sendFile(path.join(__dirname + "/uploads/" + filename));
 config.connection.query('SELECT * FROM rider_files WHERE id IN (?)',[vehicleids], function (error, vehicle_image, fields) {
  if(error){
   res.status(400).json({
    message:"Error found " +error
   })
  }
  
  else{
    if(vehicle_image[0].user_id==req.decoded.id){
   if(vehicle_image.length){
    config.connection.query('UPDATE rider_vehicles SET vehicle_image_ids =? WHERE user_id="'+req.decoded.id+'"',[vehicleids.join(',')], function (error, results, fields) {
     if(error){
      res.status(400).json({
        message:error.message
      }) 
     }
     else{ 
       console.log(results)
      res.status(200).json({
        data:{
          vehicle_image
        },
        message:"Photo addded successfully"
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

//-------------------------------------------------------//
//----------------------UPDATE VEHICLE---------------------//
//-------------------------------------------------------//


router.put('/update/:id',function(req,res){
 userid=req.decoded.id;
 vehicle_id=req.params.id;
 var registration_no=req.body.registration_no;
 var vehicles={ 
   "user_id":userid,
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
 if(!req.body.registrant_name ||  !req.body.make || !req.body.vehicle_type || !req.body.body_type ||
  !req.body.model|| !req.body.model_year|| !req.body.color|| !req.body.seat_capacity|| !req.body.engine_cc
  || !req.body.fuel_type || !req.body.interior || !req.body.pets_allowed|| !req.body.music_allowed || !req.body.smoking_allowed){
  res.status(422).json({
   message:"Please insert values for all fields",
  })    
 }else{
   config.connection.query('SELECT * FROM rider_vehicles WHERE id =?',[vehicle_id],function(err,results,fields){
    if(err)
      res.status(400).json({ message : err.message})
    if(results.length){
      if(results[0].user_id==userid){
       config.connection.query('UPDATE rider_vehicles SET ? WHERE id = "'+vehicle_id+'"',[vehicles],function (error,results,fields){
        if (error) {
         res.status(400).json({
          message:'there is some error with query'+error
         })
        }
        else{
         res.status(200).json({
          vehicles,
          message:'Vehicle updated successfully',
         })
        }
       });
      }
      else{
       res.status(403).json({
        message:'You are not authorized to modified this data.'
       })
      }
    }
    else{
     res.status(400).json({
      message:'No vehcile found for such id'
     })
    }
   })
  }
})

module.exports=router;