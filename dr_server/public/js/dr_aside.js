$(function(){
  $.ajax({
    url:"dr_aside.html",
    type:"get",
    success:function(result){
      $(result).replaceAll("#dr_aside");
      $("head").append(`<link rel="stylesheet" href="css/dr_aside.css">`);
    }
  })
})