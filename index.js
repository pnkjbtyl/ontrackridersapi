app.get('/', function(req,res){
    res.send('working')
});
app.use(express.static(__dirname+'/ontrackriders'));
app.listen(80,'192.168.1.2');
