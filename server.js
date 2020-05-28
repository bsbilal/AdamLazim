//Defines
const express = require('express');
var ip = require("ip");
var mysql = require('mysql');
const serverPort = 3850;
const app = express();
var _ = require("underscore");
var bodyParser = require('body-parser');

app.use(express.json());


function createResultData(_code,_resData,_resText)
{
    var resObject= {
        resultcode: _code,
        resuldata: _resData,
        resulttext: _resText
    }

    return resObject;

}

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "12345678",
    database: "dbadamlazim"
});



con.connect(function(err) {
    if (err) throw err;
    console.log("DB MySQL has Connected!");
});

app.listen(serverPort, function () {
    console.log('The server works at '+ip.address()+':'+serverPort);
});



app.get('/', function (req, res) {

    res.send('Hello');
    //res.send('<h1>Merhaba Express</h1>');

});

app.post('/', function (req, res) {
    res.send('Merhaba Express');
});

app.post('/register',function (req,res) {

    var insertData=req.body.data;
    let sql = "CALL  REGISTERUSER(?,?,?,?,?)";
    let insertValues = [insertData.username,
        insertData.password,
        insertData.mail,
        insertData.shownName,
        insertData.path
    ];



    con.query(sql,insertValues,function (err, result,fields) {
        if (err) throw err;
        console.log(result.affectedRows+' Rows has affected');
        var resJSON =
            createResultData(
                 "1",
                'ddfsdfs',
                'Succesful');
        var resp=resJSON;
        res.end(JSON.stringify(resp));
    });
});