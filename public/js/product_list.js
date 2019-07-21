//页面DOM和js加载完开始执行
$(function(){
  var page=parseInt(location.search.split("=")[1])||1;
  $.ajax({
    url:"/product/list",
    type:"get",
    data:{page},
    dataType:"json",
    success:function(result){
      var {titles,prices,pics,length}=result;
      var html="";
      for(var p=0;p<titles.length;p++){
        html=`
          <li class="pro_li">
            <a class="a_img" href="">
              <img src="${pics[p]}" alt="">
            </a>
            <p class="price">￥${prices[p]}</p>
            <p class="title">${titles[p]}</p>
            <a class="fav" href="">收藏</a><!-- 消除行内元素换行导致的空白
            --><a class="buy" href="">立即购买</a>
          </li>
        `;
        $("#pro_list").append(html);
      }
      $(".page>.total").html(`共${length}件 商品`);
      $(".page>.number").html(`${page}/${Math.ceil(length/12)}`);
    }
  })
  $(".next_btn").click(function(e){
    e.preventDefault();
    if(page<$(".page>.number").html().slice(-1)){
      location.search=`?page=${page+1}`;
    }
  })
  $(".prev_btn").click(function(e){
    e.preventDefault();
    if(page>1){
      location.search=`?page=${page-1}`;
    }
  })
})