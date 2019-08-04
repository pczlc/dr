const express=require("express");
const pool=require("../pool.js")
const router=express.Router();

//获取头部数据
router.get("/headerImg",(req,res)=>{
  var sql="SELECT hname,img,isLeft FROM dr_header_img";
  var data={left:[],right:[]};
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //将左右图片分类存储
    for(var i=0;i<result.length;i++){
      if(result[i].isLeft){
        data.left.push(result[i]);
      }else{
        data.right.push(result[i]);
      }
    }
    res.send(data);
  })
})
//商品列表
router.get("/list",(req,res)=>{
  var page=req.query.page;
  var pageSize=req.query.pageSize;
  var now=(page-1)*pageSize;
  pageSize=parseInt(pageSize);
  var data={pros:[],count:0,len:0};
  var sql="SELECT title,price,img FROM dr_ring LIMIT ?,?";
  pool.query(sql,[now,pageSize],(err,result)=>{
    if(err) throw err;
    data.pros=result;
    var sql="SELECT rid FROM dr_ring";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      data.count=Math.ceil(result.length/pageSize);
      data.len=result.length;
      res.send(data);
    })
  })
})

module.exports=router;