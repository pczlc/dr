$(function(){
  $.ajax({
    url:"footer.html",
    type:"get",
    success:function(result){
      $(result).replaceAll("#footer");
      $("head").append(`<link rel="stylesheet" href="css/footer.css">`);
    }
  })
})