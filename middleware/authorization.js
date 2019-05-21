var express=require('express');
var router=express.Router();
var public=require('../controllers/public');
const jwt = require('jsonwebtoken');

var auth= function(req,res,next){
    var token=  req.headers['x-access-code'];
    console.log(req.body)
    if(token){
     jwt.verify(token,'secretkey',function(err,decoded){
       console.log(decoded)
      if(err){
       res.status(401).json({
        message:err.message 
       })
      }else{
        req.decoded=decoded
        res.status(200);
        return next()
      } 
     })
    }else{
      res.status(400).json({
      message:'Unable to authorize'
      })
     }
 }
    

module.exports=auth;
