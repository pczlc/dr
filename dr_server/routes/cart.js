const express=require("express");
const pool=require("../pool.js");
const router=express.Router();
// 向购物车中添加数据
router.post("/addItem",(req,res)=>{
  // 先查询购物车中是否有该条数据，没有则添加
  var uid=req.body.user_id;
  var rid=req.body.ring_id;
  var sql="SELECT oid FROM dr_shopping_cart WHERE user_id=? AND ring_id=?";
  pool.query(sql,[uid,rid],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      var ringObj=req.body;
      var sql="INSERT INTO dr_shopping_cart set ?";
      pool.query(sql,[ringObj],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"添加成功"});
        }
      })
    }else{
      res.send({code:-1,msg:"该数据已存在"});
    }
  })
})
// 查询购物车数据列表
router.get("/list",(req,res)=>{
  var uid=req.query.uid;
  var sql="SELECT ring_id,ring_title,ring_img,ring_price FROM dr_shopping_cart WHERE user_id=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})
// 删除一条购物车数据
router.post("/delItem",(req,res)=>{
  var rid=req.body.ring_id;
  var sql="DELETE FROM dr_shopping_cart WHERE ring_id=?";
  pool.query(sql,[rid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"});
    }
  })
})
module.exports=router;