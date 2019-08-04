const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./routes/user.js');
const productRouter=require('./routes/product.js');
const indexRouter=require('./routes/index.js');
const cors=require("cors");
const session=require("express-session");

var app=express();
app.listen(5050);
//配置跨域模块
app.use(cors({
  // 允许跨域访问程序地址列表
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true //请求验证
}));
//配置session模块
app.use(session({
  secret:"128位字符串",    //安全字符串
  resave:true,            //请求时更新数据
  saveUninitialized:true  //保存初始数据
}));

app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended:false
}));
app.use('/user',userRouter);
app.use('/product',productRouter);
app.use('/index',indexRouter);