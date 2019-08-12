const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

/*用户登录*/
router.get('/login',(req,res)=>{
	var uname=req.query.uname;
	var upwd=req.query.upwd;
	pool.query('SELECT uid FROM dr_user WHERE (phone=? or email=?) AND upwd=?',[uname,uname,upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
      req.session.uid=result[0].uid;
			res.send({code:1,msg:"登录成功"});
		}else{
			res.send({code:-1,msg:"登录失败"});
		}
	});
});
//查询登录状态
router.get('/getSession',(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"未登录"});
  }else{
    var sql=`SELECT user_name FROM dr_user WHERE uid=${uid}`;
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      var user_name=result[0].user_name;
      res.send({code:1,msg:"已登录",user_name:user_name});
    })
  }
});
//退出登录
router.get('/exit',(req,res)=>{
  req.session.destroy();
});
/*用户注册*/
router.post('/register',(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var sql="SELECT uid FROM dr_user WHERE phone=? OR email=?";
  pool.query(sql,[uname,uname],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:-1,msg:"该手机号或邮箱已存在"});
    }else{
      //生成6位随机用户姓名user_name
      var arr="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
      var user_name="";
      for(var i=0;i<6;i++){
        //生成arr的随机下标
        var num=Math.floor(Math.random()*arr.length);
        user_name+=arr[num];
      }
      var sql;
      var reg=/\d{11}/;
      if(reg.test(uname)){
        sql="INSERT INTO dr_user(phone,upwd,user_name) values(?,?,?)";
      }else{
        sql="INSERT INTO dr_user(email,upwd,user_name) values(?,?,?)";
      }
      pool.query(sql,[uname,upwd,user_name],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"注册成功"});
        }else{
          res.send({code:-1,msg:"注册失败"});
        }
      })
    }
  })
});

module.exports=router;