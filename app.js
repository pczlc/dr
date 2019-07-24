const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./routes/user.js');
const productRouter=require('./routes/product.js');

var app=express();
var server=app.listen(8080);

app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended:false
}));
app.use('/user',userRouter);
app.use('/product',productRouter);