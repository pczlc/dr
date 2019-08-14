<template>
  <div class="dr_aside" @mouseover="showBg" @mouseout="hideBg">
    <div class="dr_svc1">
      <a href="javascript:;"></a>
      <p>在线<br>客服</p>
      <i class="abs_l"></i>
      <i class="abs_r"></i>
    </div>
    <div class="dr_svc2">
      <a href="javascript:;"></a>
      <p>预约</p>
      <div class="show"></div>
      <div>预约进店</div>
    </div>
    <div class="dr_svc3">
      <a href="javascript:;"></a>
      <p>购物车</p>
      <div class="show" @click="toCart"></div>
      <div>购物车</div>
    </div>
    <div class="dr_svc4">
      <a href="javascript:;"></a>
      <p>订单</p>
      <div class="show"></div>
      <div>我的订单</div>
    </div>
    <div class="dr_svc5">
      <a href="javascript:;"></a>
      <p>收藏</p>
      <div class="show"></div>
      <div>我的收藏</div>
    </div>
    <div class="dr_svc6">
      <a href="javascript:;"></a>
      <p>新人礼</p>
      <div class="show"></div>
      <div>新人礼包</div>
    </div>
    <div class="dr_svc7">
      <a href="javascript:;"></a>
      <p>手机端</p>
      <div class="show"></div>
      <img src="../../public/aside/ewm.jpg" alt="">
    </div>
    <div class="dr_svc8">
      <a href="javascript:;"></a>
      <div class="show" @click="toTop"></div>
      <div>返回顶部</div>
    </div>
  </div>
</template>

<script>
export default {
  methods:{
    showBg(e){
      if(e.target.className=="show"){
        e.target.parentNode.style.background="#fff";
      }
    },
    hideBg(e){
      if(e.target.className=="show"){
        e.target.parentNode.style.background="transparent";
      }
    },
    toCart(){
      this.$router.push("/Cart");
    },
    toTop(){
      window.scrollTo(0,0);
    }
  }
}
</script>

<style scoped>
  .dr_aside{
    position:fixed;
    width:50px;
    bottom:0;right:30px;
    display:flex;
    flex-direction:column;
    background:#f4f2f3;
    font-size:12px;
    color:#8b766c;
    z-index:3;
  }
  .dr_aside>div{position:relative;text-align:center;}
  /* 选择器，第2个到第7个 */
  .dr_aside>div:nth-child(-n+7):nth-child(n+2){
    height:60px;
    margin:5px 0;
    padding-top:5px;
  }
  .dr_aside>div:nth-child(2){margin-top:15px !important;}
  .dr_aside>div>a{
    display:block;
    background-image:url(../../public/aside/icon_servie.png);
    margin:0 auto;
  }
  .dr_svc1{
    width:58px;
    left:-4px;
    background:#cebeb0;
    padding-bottom:14px;
  }
  .dr_svc1>a{
    width:50px;height:50px;
    background:url(../../public/aside/zxkf.gif) no-repeat !important;
  }
  .dr_aside p:nth-child(2){line-height:28px;}
  .dr_aside .dr_svc1>p{color:#fff;line-height:16px;}
  .abs_l{
    width:4px;height:4px;
    position:absolute;
    bottom:-4px;left:0;
    background:url(../../public/aside/icon_yleft.png);
  }
  .abs_r{
    width:4px;height:4px;
    position:absolute;
    bottom:-4px;right:0;
    background:url(../../public/aside/icon_yright.png);
  }
  .dr_svc2 a{
    width:30px;height:26px;
    background-position:0 -279px;
  }
  .dr_svc3 a{
    width:30px;height:29px;
    background-position:0 -33px;
  }
  .dr_svc4 a{
    width:24px;height:30px;
    background-position:-3px -74px;
  }
  .dr_svc5 a{
    width:30px;height:27px;
    background-position:0 -120px;
  }
  .dr_svc6 a{
    width:30px;height:30px;
    background-position:0 -315px;
  }
  .dr_svc7 a{
    width:18px;height:30px;
    background-position:-6px -199px;
  }
  .dr_svc8 a{
    width:48px;height:48px;
    background-image:url(../../public/aside/totop.jpg) !important;
  }
  .dr_aside>div>div:last-child{
    position:absolute;
    width:4rem;height:100%;
    top:0;right:0px;
    background:#fff;
    line-height:65px;
    color:#bc9e8a;
    opacity:0;
    z-index:1;
  }
  .show:hover+div,.show:hover+img{
    right:50px !important;
    opacity:1 !important;
    transition:all .3s linear;
  }
  .dr_svc7 img{
    position:absolute;
    top:-60px;right:0px;
    padding-left:14px;
    opacity:0;
    background:#fff;
    z-index:1;
  }
  .dr_aside>div.dr_svc8 div{line-height:48px;}
  .show{
    width:100%;height:100%;
    position:absolute;
    left:0;top:0;
    z-index:2;
    cursor:pointer;
  }
</style>
