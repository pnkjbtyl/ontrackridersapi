var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'riders_db'
});

connection.connect(function(err){
 if(!err) {
    console.log("Database is connected");
 
 } 
 else {
    console.log("Error while connecting with database");
 }
});

var config = {
   base_path:'E:/NODE JS PPROJECTS/server/uploads/',
   base_url:'http://192.168.1.14:3000',
   connection: connection
}

module.exports = config;
//{connection, base_url};
