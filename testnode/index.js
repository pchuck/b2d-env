var express = require('express');

var PORT = 8181;
var app = express();
app.get('/', function (req, res) {
  res.send('testnode\n');
});

app.listen(PORT);
console.log('running on http://localhost:' + PORT);

