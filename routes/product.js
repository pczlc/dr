const express=require("express");
const pool=require("../pool.js")
const router=express.Router();

router.get("/header_pic",(req,res)=>{
  var sql="SELECT range_id,md FROM dr_ring INNER JOIN dr_ring_pic ON rid=ring_id";
  var output=[];
  var rids=[];
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    for(var p of result){
      if(rids.indexOf(p.range_id)===-1){
        rids.push(p.range_id);
        output.push(p.md);
      }
    }
    res.send(output);
  })
})
router.get("/list",(req,res)=>{
  var page=req.query.page;
  var output={
    titles:[],
    prices:[],
    pics:[],
    length:""
  };
  var rids=[];
  var sql="SELECT rid,title,price,md FROM dr_ring INNER JOIN dr_ring_pic ON rid=ring_id";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    for(var p of result){
      if(rids.indexOf(p.rid)===-1){
        rids.push(p.rid);
        output.titles.push(p.title);
        output.prices.push(p.price);
        output.pics.push(p.md);
      }
    }
    output.length=rids.length;
    output.titles=output.titles.splice((page-1)*12,12);
    output.prices=output.prices.splice((page-1)*12,12);
    output.pics=output.pics.splice((page-1)*12,12);
    res.send(output);
  })
})

module.exports=router;