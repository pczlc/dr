$(function(){
  var $length=$("#img_change>a").length;
  //定义跳转到指定位置函数
  function moveTo(i){
    //删除所有的active样式，并给当前位置加上active
    $("#img_change>a").removeClass("active");
    $($("#img_change>a")[i]).addClass("active");
    $(".banner_indicators>li").removeClass("active");
    $($(".banner_indicators>li")[i]).addClass("active");
  }
  //点击上一页，判断位置调用函数
  $(".prev_button").click(function(){
    if($("#img_change>a:first").hasClass("active")){
      moveTo($length-1);
    }else{
      moveTo($("#img_change>a.active").index()-1);
    }
    clearTimer();
  })
  //封装向下翻一页函数
  function next(){
    if($("#img_change>a:last").hasClass("active")){
      moveTo(0);
    }else{
      moveTo($("#img_change>a.active").index()+1);
    }
  }
  //点击下一页，调用函数
  $(".next_button").click(function(){
    next();
    clearTimer();
  })
  //利用事件委托，绑定指示器点击事件
  $(".banner_indicators").on("click","li",function(){
    moveTo($(this).index());
    clearTimer();
  })
  //定义计时器
  var timer=setInterval(next,4000);
  //定义事件触发清除定时器函数
  function clearTimer(){
    clearInterval(timer);
    timer=setInterval(next,4000);
  }
})