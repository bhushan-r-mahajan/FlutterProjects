const express = require ('express');
var http = require('http');

const app = express()
const port = process.env.PORT || 9090;

var server = http.createServer(app);


var io = require('socket.io')(server);

//middleware

app.use(express.json());

io.on("connection", (socket) => {
    console.log("Connected");  
    console.log(socket.id, "has joined!");
    socket.on("/test", (msg) => {
        console.log(msg)
    })
});

server.listen(port, () => {
    console.log(`Server started at port ${port}`);  
});