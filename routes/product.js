const express=require("express");
const pool=require("../pool.js")
const router=express.Router();

router.get("/list",(req,res)=>{
  var page=parseInt(req.query.page)-1;
  var start=page*12;
  pool.query("SELECT * FROM dr_ring LIMIT ?,?",[start,12],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;