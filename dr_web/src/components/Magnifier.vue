<template>
  <div class="ring_imgs float_l">
    <div>
      <div class="md_img">
        <div class="img_item">
          <img
          v-for="(img,i) of imgs" 
          :src="`http://127.0.0.1:5050/${img}`" 
          :key="i"
          :class="status[i]">
        </div>
        <div class="gray_bg"></div>
      </div>
      <div class="lg_img"></div>
    </div>
    <div class="sm_img">
      <span class="prev_btn visible"></span>
      <span class="next_btn visible"></span>
      <div class="sm_img_overflow">
        <ul>
          <li v-for="(img,i) of imgs" :key="i">
            <img :class="status[i]" :src="`http://127.0.0.1:5050/${img}`" 
            @mouseover="show(i)">
          </li>
        </ul>
      </div>
    </div>
    <ul class="ringbuy_share">
      <span>分享到 :</span>
      <a href=""></a>
      <a href=""></a>
      <a href=""></a>
      <a href=""></a>
      <a href=""></a>
      <a href=""></a>
    </ul>
  </div>
</template>
<script>
export default {
  props:{
    imgs:{type:Array},
    status:{type:Array},
    show:{type:Function}
  }
}
</script>
<style scoped>
  .ring_imgs,.md_img>img{width:460px;}
  .ring_imgs{position:relative;}
  .md_img{width:460px;height:460px;}
  .img_item{
    position:relative;
    width:100%;height:100%;
  }
  .gray_bg{
    position:absolute;
    top:0;left:0;
    width:150px;height:150px;
    background:rgba(153, 153, 153,.4);
    cursor:move;
  }
  .md_img img{
    display:none;
    width:100%;height:100%;
    box-sizing:border-box;
    border:1px solid #f3f3f3;
  }
  .md_img img.active{display:block;}
  .lg_img{
    position:absolute;
    display:none;
    right:-200px;top:0;
    width:200px;height:200px;
    background:url("../../public/products/BELIEVE系列 典雅 50分 G色/1.jpg") no-repeat;
    background-size:200%;  
    border:1px solid rgb(204,204,204);
    z-index:999;
  }
  .sm_img{margin:20px 0;position:relative;}
  .prev_btn,.next_btn{
    position:absolute;
    top:50%;margin-top:-9.5px;
    width:10px;height:19px;
    background:url(../../public/icon/pre_next.png) no-repeat;
  }
  .prev_btn{left:15px;background-position:0 0;}
  .next_btn{right:15px;background-position:-10px -20px;}
  .prev_btn.visible{background-position:0 -20px;}
  .next_btn.visible{background-position:-10px 0;}
  .sm_img_overflow{
    width:384px;
    overflow:hidden;
    margin:0 auto;
  }
  .sm_img_overflow ul{display:flex;}
  .sm_img_overflow li{
    width:60px;height:60px;
    margin-right:20px;
  }
  .sm_img_overflow img{
    width:100%;
    box-sizing:border-box;
  }
  .sm_img_overflow img.active{
    border:1px solid #ffa6a6;
  }
  .ringbuy_share{
    text-align:center;
    line-height:26px;
    padding:10px;
  }
  .ringbuy_share>span{
    display:inline-block;
    font-size:12px;
    color:#7f7f7f;
    margin-right:3px;
  }
  .ringbuy_share>a{
    display:inline-block;
    width:26px;height:26px;
    background:url(../../public/icon/ico-shares.png);
    margin:0 2px;
    vertical-align:middle;
    outline: 0;border:0;font-size:0;
  }
  .ringbuy_share>a:nth-child(2){background-position:0 0;}
  .ringbuy_share>a:nth-child(3){background-position:-31px 0;}
  .ringbuy_share>a:nth-child(4){background-position:-62px 0;}
  .ringbuy_share>a:nth-child(5){background-position:-93px 0;}
  .ringbuy_share>a:nth-child(6){background-position:0 -34px;}
  .ringbuy_share>a:nth-child(7){background-position:-124px 0;}
  .ringbuy_share>a:hover{background-position-y:-68px;}
  .ringbuy_share>a:nth-child(6):hover{background-position:0 -102px;}
</style>
