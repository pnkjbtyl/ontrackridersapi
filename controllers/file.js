var express=require("express");
var bodyParser=require('body-parser');
var express=require("express");
var router = express.Router();
var path=require('path');
var multer=require('multer');
var dateTime = require('node-datetime');
var dt = dateTime.create();
var formatted = dt.format('Y-m-d H:M:S');
var formidable = require('formidable');


var connection = require('../config');
//-------------------------------------------------------//
//--------------------UPLOAD IMAGE-----------------------//
//-------------------------------------------------------//

router.post('/file',function (req, res) {
  if (req.url == '/file') {
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
      res.write('File uploaded');
      res.end();
    });
  } else {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write('<form action="fileupload" method="post" enctype="multipart/form-data">');
    res.write('<input type="file" name="filetoupload"><br>');
    res.write('<input type="submit">');
    res.write('</form>');
    return res.end();
  }
})
module.exports=router;