var express=require("express");
var bodyParser=require('body-parser');
var router = express.Router();
var connection = require('../config');
var path=require('path');
var multer=require('multer');

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
//-------------------------------------------------------//
//--------------FETCH CURRENT USER-----------------------//
//-------------------------------------------------------//
router.get('/:uid?',function(req,res){
 id=req.params.uid || req.decoded.id
 
 connection.query('SELECT * FROM rider_users WHERE id = ?',[id],function (error, results, fields) {
  if (error) {
   console.log(error)
   res.status(400).json({
    message:'there are some error with query'
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
      message:"Id Doesn't Exist"
     })
    }
 })
})
module.exports=router;