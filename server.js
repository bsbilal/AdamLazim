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

app.post('/register',function (req,res) {
    var insertData=req.body.data;
    let sql = "CALL  REGISTERUSER(?,?,?)";
    let insertValues = [insertData.username,
        insertData.password,
        insertData.mail
    ];

    con.query(sql,insertValues,function (err, result,fields) {
        if (err) throw err;

        var newObj=JSON.parse(JSON.stringify(result[0]));
        console.log(newObj[0].insertedid);
        var newuserid=parseFloat(newObj[0].insertedid);
        console.log(newuserid);
        let sqlInsert="CALL USER_REGISTER_COMPLETE(?,?,?)";
        let insertValues2 = [newuserid,
            insertData.shownName,
            insertData.path
        ];
        con.query(sqlInsert,insertValues2,function (err, result,fields) {
            if (err) throw err;

            console.log('go on');
            var resJSON =
                createResultData(
                    "1",
                    ""+newObj[0].insertedid+"",
                    'Succesful');
            var resp=resJSON;
            res.end(JSON.stringify(resp));
        });

    });
});

app.post('/CreateEvent',function (req,res) {
    var insertData=req.body.data;
    let sql = "CALL  CREATE_EVENT(?,?,?,?,?,?,?)";
    let insertValues = [
        insertData.event_title,
        insertData.event_date,
        insertData.event_detail,
        insertData.event_owner_id,
        insertData.event_isAvailable,
        insertData.event_longitude,
        insertData.event_latitude,

    ];

    con.query(sql,insertValues,function (err, result,fields) {
        if (err) throw err;

        var newObj=JSON.parse(JSON.stringify(result));

        if(newObj.affectedRows>0)
            var resJSON =
                createResultData(
                    "1",
                    "",
                    'Succesful');
        var resp=resJSON;

            res.end(JSON.stringify(resp));


    });
});


app.post('/sendEventJoinRequest',function (req,res) {
    var insertData=req.body.data;
    let sql = "CALL  EVENTJOINREQUEST(?,?,?)";
    let insertValues = [
        insertData.requester_id,
        insertData.receiver_id,
        insertData.request_detail
    ];

    con.query(sql,insertValues,function (err, result,fields) {
        if (err) throw err;

        var newObj=JSON.parse(JSON.stringify(result));

        if(newObj.affectedRows>0)
            var resJSON =
                createResultData(
                    "1",
                    "",
                    'Succesful');
        var resp=resJSON;

        res.end(JSON.stringify(resp));


    });
});

app.post('/getEvents',function (req,res) {
    var searchData=req.body.data;


    con.query('CALL GET_EVENTS('+parseInt(searchData.requester_id)+')',function (err, result,fields) {
        if (err) throw err;
        var numRows = result.length;

        if(numRows>1)
        {
            console.log(result[0]);


            var resp=result[0];
            res.end(JSON.stringify(resp));

        }
        else
            res.end(JSON.stringify(createResultData(
                "0",
                "err",
                'Does Not found')));



    });
});

app.get('/userMainDetail',function (req,res) {
    var searchData=req.body;
    let sql = "CALL  GETUSERDETAIL(?)";
    let insertValues = [searchData.id
    ];

    con.query(sql,insertValues,function (err, result,fields) {
        if (err) throw err;
        var numRows = result.length;

        if(numRows==1)
        {

            var newObj=JSON.parse(JSON.stringify(result[0][0]));

            console.log(newObj);

            var resJSON =
                createResultData(
                    "1",
                    ""+JSON.stringify(newObj)+"",
                    'Succesful');
            var resp=resJSON;
            res.end(JSON.stringify(resp));

        }
        else
            res.end(JSON.stringify(createResultData(
                "0",
                "err",
                'Does Not found')));



    });
});
