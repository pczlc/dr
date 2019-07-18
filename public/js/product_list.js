//页面DOM和js加载完开始执行
$(function(){
  ajax({
    url:"/product/list/?page=1",
    type:"get",
    dataType:"json"
  }).then(result=>{
    for(var i =0;i<result.length;i++){
      var {}
    }
  })
})