const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

/*用户登录*/
router.get('/v1/login/:uname-:upwd',(req,res)=>{
	var $uname=req.params.uname;
	var $upwd=req.params.upwd;
	pool.query('SELECT uid FROM xz_user WHERE (uname=? or email=?) AND upwd=?',[$uname,$uname,$upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send('1');
		}else{
			res.send('0');
		}
	});
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