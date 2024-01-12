const express = require('express');
const cors = require('cors')
const docenteRoute  = require('./routes/docente');

const app = express();
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
 
app.use(cors());
//-----------------------settings

app.set('appName','proyectoBD');

//--------------------------------
app.use(express.urlencoded({ extended: false }));

app.use(express.json());



app.use(docenteRoute)


app.listen(3000);
console.log(`server ${app.get('appName')} on port ${3000}`)