$(function(){
  $.ajax({
    url:"header.html",
    type:"get",
    success:function(result){
      $(result).replaceAll("#header");
      $("head").append(`<link rel="stylesheet" href="css/header.css">`);
    }
  })
})
//页面加载完成后再获取图片
$(window).load(function(){
  //获取header中图片
  $.ajax({
    url:"http://127.0.0.1:8080/product/header_pic",
    type:"get",
    success:function(result){
      var as=$(".dr_set>p>a");
      for(var i=0;i<as.length;i++){
        //图片临时存放在alt中
        $(as[i]).attr("alt",result[i]);
      }
      //绑定事件
      $(".dr_set:eq(0)").on("mouseenter","a",function(){
        $(".dr_navsuv_second .left_img").attr("src",$(this).attr("alt"));
      })
      $(".dr_set:eq(1)").on("mouseenter","a",function(){
        $(".dr_navsuv_second .right_img").attr("src",$(this).attr("alt"));
      })
    }
  })
})
