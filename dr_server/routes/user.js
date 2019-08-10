const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

/*用户登录*/
router.get('/login',(req,res)=>{
	var uname=req.query.uname;
	var upwd=req.query.upwd;
	pool.query('SELECT uid FROM dr_user WHERE (uname=? or email=?) AND upwd=?',[uname,uname,upwd],(err,result)=>{
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
router.post('/v1/register',(req,res)=>{
	var obj=req.body;
	pool.query('INSERT INTO xz_user SET ?',[obj],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send('1');
		}else{
			res.send('0');
		}
	});
});

module.exports=router;