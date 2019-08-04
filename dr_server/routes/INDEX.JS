const express=require("express");
const pool=require("../pool.js")
const router=express.Router();

router.get("/getBanner",(req,res)=>{
  var sql="SELECT img FROM dr_index_banner";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;