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
  if(!page){page=1};
  if(!pageSize){pageSize=12};
  var now=(page-1)*pageSize;
  pageSize=parseInt(pageSize);
  var data={pros:[],count:0,len:0};
  var sql="SELECT rid,title,price,img FROM dr_ring LIMIT ?,?";
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
//商品详情
router.get("/details",(req,res)=>{
  var rid=req.query.rid;
  var data={msg:[],imgs:{}};
  var sql="SELECT title,price FROM dr_ring WHERE rid=?";
  pool.query(sql,[rid],(err,result)=>{
    if(err) throw err;
    data.msg=result[0];
    var sql="SELECT md FROM dr_ring_img WHERE ring_id=?";
    pool.query(sql,[rid],(err,result)=>{
      if(err) throw err;
      data.imgs=result;
      res.send(data);
    })
  })
})
module.exports=router;