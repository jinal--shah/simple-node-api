/*
 * simple api demo using express
 * - exposes /message and /health
*/
var express = require("express");
var app = express();
app.get("/message", (req, res, next) => {
 res.send({ message: "hola mundo" });
});
app.get("/health", (req, res, next) => {
 res.send({ service: "OK"});
});
app.listen(5000, () => {
 console.log("Server running on port 5000");
});

module.exports = app;
