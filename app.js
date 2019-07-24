const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./routes/user.js');
const productRouter=require('./routes/product.js');
const cors=require("cors");

var app=express();
//此处必须var server保存监听才能使用cors
var server=app.listen(8080);
app.use(cors({
  origin:"http://127.0.0.1:5501"//不能用*
}));//从此所有响应，自动带Access-Control-Allow-Origin:http://127.0.0.1:5500
//万一客户端浏览器地址发生变化，只改这里origin一处即可！

app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended:false
}));
app.use('/user',userRouter);
app.use('/product',productRouter);