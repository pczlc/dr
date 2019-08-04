<template>
  <div class="w-1360">
    <header-vue></header-vue>
    <div class="bg_white">
      <ul class="dr_bread">
        <li><a href="javascript:;">DR</a></li>
        <li><a href="javascript:;">求婚钻戒</a></li>
        <li><a href="javascript:;">MY HEART系列</a></li>
      </ul>
      <div class="w-1000">
        <div class="ringbuy_cort clear_after">
          <div class="ring_pics float_l">
            <div class="md_pic">
              <img src="../../public/products/BELIEVE系列 典雅 50分 G色/1.jpg" alt="">
            </div>
            <div class="sm_pic">
              <span class="prev_btn visible"></span>
              <span class="next_btn visible"></span>
              <div class="sm_pic_overflow">
                <ul>
                  <li><img class="active" src="../../public/products/BELIEVE系列 典雅 50分 G色/1.jpg" alt=""></li>
                </ul>
              </div>
            </div>
            <div></div>
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
          <div class="ring_msg float_r">
          <div class="lg"></div>
          </div>
        </div>
      </div>
    </div>
    <footer-vue></footer-vue>
    <aside-vue></aside-vue>
  </div>
</template>

<script>
import HeaderVue from '../components/Header.vue'
import FooterVue from '../components/Footer.vue'
import AsideVue from '../components/Aside.vue'
export default {
  data(){
    return {}
  },
  components:{
    HeaderVue,
    FooterVue,
    AsideVue
  }
}
</script>

<style scoped>
  .bg_white{background:#fff;border-top:1px solid #666;}
  .dr_bread{
    height:70px;
    line-height:70px;
    display:flex;
    padding-left:40px;
  }
  .dr_bread>li>a{font-size:12px;color:#333;}
  .dr_bread>li+li:before{content:">";margin:0 5px;}
  .dr_bread>li>a:hover{color:#8b766c;}
  .w-1000{width:1000px;margin:0 auto;text-align:center;}
  .ringbuy_cort{padding-bottom:60px;}
  .ring_pics,.md_pic>img{width:460px;}
  .md_pic>img{box-sizing:border-box;border:1px solid #f3f3f3;}
  .sm_pic{margin:20px 0;position:relative;}
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
  .sm_pic_overflow{
    width:384px;
    overflow:hidden;
    margin:0 auto;
  }
  .sm_pic_overflow ul{display:flex;}
  .sm_pic_overflow li{
    width:60px;height:60px;
  }
  .sm_pic_overflow img{
    width:100%;
    box-sizing:border-box;
    margin-right:20px;
  }
  .sm_pic_overflow img.active{
    border:1px solid #ffa6a6;
  }
  .ringbuy_share{
    display:flex;
    justify-content:center;
    line-height:26px;
    padding:10px;
  }
  .ringbuy_share>span{
    font-size:12px;
    color:#7f7f7f;
    margin-right:3px;
  }
  .ringbuy_share>a{
    width:26px;height:26px;
    background:url(../../public/icon/ico-shares.png);
    margin:0 2px;
  }
  .ringbuy_share>a:nth-child(2){background-position:0 0;}
  .ringbuy_share>a:nth-child(3){background-position:-31px 0;}
  .ringbuy_share>a:nth-child(4){background-position:-62px 0;}
  .ringbuy_share>a:nth-child(5){background-position:-93px 0;}
  .ringbuy_share>a:nth-child(6){background-position:0 -34px;}
  .ringbuy_share>a:nth-child(7){background-position:-124px 0;}
  .ringbuy_share>a:hover{background-position-y:-68px;}
  .ringbuy_share>a:nth-child(6):hover{background-position-y:0 -102px;}
  .ring_msg{width:520px;}

</style>
