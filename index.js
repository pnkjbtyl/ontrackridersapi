var express=require("express");
var formidable= require('express-formidable');
var bodyParser=require('body-parser');
var users=require('./controllers/users');
var vehicle=require('./controllers/vehicles');
var index=require('./controllers/public');
var authorization=require('./middleware/authorization');
var files=require('./controllers/files');
var map=require('./controllers/map');

var app = express();

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
//app.use(formidable());

app.use(function(req, res, next){

    console.log('');
    console.log('Request Headers - ');
    console.log('---------------');
    console.log(req.headers);
    console.log('------------------------------------------------------------------------------------');
    console.log('');
    console.log('Request Body - ');
    console.log('---------------');
    console.log(req.body);
    console.log('------------------------------------------------------------------------------------');
    next();
});

var router=express.Router();
router.get('/', function(req,res,next){
    res.status(200).json({
        message:'It works'
    })
});

router.use('/',index);
router.use('/users',authorization,users);
router.use('/vehicles',authorization,vehicle);
router.use('/files',authorization,files);
router.use('/',map);
//app.use('/uploads',express.static(__dirname+'./uploads'));
app.use('/',express.static('E:/NODE JS PPROJECTS/server/uploads/'));
app.use('/',router);
app.use(function(req, res, next){
    var err= new Error('Endpoint not found');
    res.status(400).json({
        message:'Endpoint not found'
    })
});
app.use(function(err, req, res, next){
    res.status(err.status || 500).json({
        message: err.message
    })
});
//app.listen(3000,'192.168.43.114');
app.listen(3000,'192.168.1.14');