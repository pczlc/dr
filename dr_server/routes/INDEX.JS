const express=require("express");
const pool=require("../pool.js")
const router=express.Router();

router.get("/getBanner",(req,res)=>{
  var sql="SELECT img FROM dr_index_banner";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"获取成功",data:result});
  })
})

module.exports=router;