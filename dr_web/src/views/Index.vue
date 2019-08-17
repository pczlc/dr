<template>
  <div class="dr_bg">
    <div class="w-1360">
      <header-vue></header-vue>
      <banner-vue :imgList="imgList"></banner-vue>
      <div class="dr_love_search clear_after">
        <!-- 小视频 -->
        <div class="f1" @click="showVideo">
          <div class="play_button"></div>
          <img src="../../public/index/15504818355c6a79abcae4d.jpg" alt="">
        </div>
        <!-- 身份证查询 -->
        <div class="f2">   
          <img src="../../public/index/logo_noword.png" alt="">
          <p>男士凭身份证一生仅能定制一枚DR求婚钻戒</p>
          <p>购买时 签署一生唯一真爱协议</p>
          <p>终生不可更改</p>
          <div class="u_line"></div>
          <div class="id_input">
            <input type="text" placeholder="请输入身份证号验证真爱承诺">
            <a href="javascript:;"></a>
          </div>
        </div>
      </div>
      <!-- 钻戒类型 -->
      <div class="dr_family clear_after">
        <div class="family_left">
          <div class="family_item">
            <router-link class="a_img" to="Products">
              <img src="../../public/index/15597245855cf78229c541d.jpg" alt="">
            </router-link>
            <p>求婚钻戒</p>
          </div>
          <div class="family_item">
            <router-link class="a_img" to="Products">
              <img src="../../public/index/15597248705cf78346f2c6a.jpg" alt="">
            </router-link>
            <p>真爱礼物</p>
          </div>
        </div>
        <div class="family_right">
          <div class="family_item">
            <router-link class="a_img" to="Products">
              <img src="../../public/index/15597246205cf7824cbdddb.jpg" alt="">
            </router-link>
            <p>男戒</p>
          </div>
          <div class="family_item">
            <router-link class="a_img" to="Products">
              <img src="../../public/index/15597249315cf78383a5133.jpg" alt="">
            </router-link>
            <p>结婚对戒</p>
          </div>
        </div>
      </div>
      <!-- 城市店铺 -->
      <div class="dr_shop clear_after">
        <div class="float_l">
          <a class="a_img" href="javascript:;">
            <img src="../../public/index/15597254485cf7858849818.jpg" alt="">
          </a>
        </div>
        <div class="float_r city_shop">
          <img src="../../public/index/logo_noword.png" alt="">
          <div class="input_city">
            <span>成都</span>
            <input type="text" placeholder="请输入城市名称如：成都">
            <router-link class="a_img" to="Products">
              <img src="../../public/index/ico-wseach.png" alt="">
            </router-link>
          </div>
          <a class="order_btn" href="javascript:;">预约有礼（首次预约可领取精美礼品）</a>
        </div>
      </div>
      <!-- 其他页面 -->
      <div class="dr_other">
        <a class="a_img" href="javascript:;">
          <img src="../../public/index/15483197085c497bdc7f34e.jpg" alt="">
          <p>DR粉丝故事</p>
        </a>
        <a class="a_img" href="javascript:;">
          <img src="../../public/index/15610866665d0c4aca3d873.jpg" alt="">
          <p>真爱明星</p>
        </a>
        <a class="a_img" href="javascript:;">
          <img src="../../public/index/15625739465d22fc7abc1a5.jpg" alt="">
          <p>DR活动专题</p>
        </a>
      </div>
      <footer-vue></footer-vue>
      <aside-vue></aside-vue>
    </div>
    <div class="paris_video" :style="`display:${videoDis}`">
      <div>
        <video src="../../public/index/paris.mp4" controls></video>
        <div class="close" @click="closeVideo"></div>
      </div>
    </div>
  </div>
</template>
<script>
import HeaderVue from '../components/Header.vue'
import BannerVue from '../components/Banner.vue'
import FooterVue from '../components/Footer.vue'
import AsideVue from '../components/Aside.vue'
export default {
  data(){
    return {
      imgList:[],
      videoDis:"none"
    }
  },
  methods:{
    getBannerImg(){
      this.axios.get("index/getBanner").then(res=>{
          var list=res.data.data;
          for(var elem of list){
            elem.status="";
          }
          //第一项初始化为active
          list[0].status="active";
          this.imgList=list;
      })
    },
    showVideo(){
      this.videoDis="block";
      var v=document.querySelector(".paris_video video");
      v.play();
    },
    closeVideo(){
      this.videoDis="none";
      var v=document.querySelector(".paris_video video");
      v.pause();
    }
  },
  created(){
    this.getBannerImg();
  },
  components:{
    HeaderVue,
    BannerVue,
    FooterVue,
    AsideVue
  }
}

</script>
<style scoped>
  .dr_love_search{margin-top:16px;}
  .dr_love_search .f1{
    position:relative;
    float:left;
    width:628px;height:462px;
  }
  .dr_love_search .f2{
    float:left;
    width:732px;height:462px;
    background:#f5f1ee;
    text-align:center;
  }
  .dr_love_search .play_button{
    position:absolute;
    width:100%;height:100%;
    background:url(../../public/index/ico-play.png) no-repeat center center;
  }
  .play_button:hover{cursor:pointer;}
  .dr_love_search .f2 img{margin-top:54px;margin-bottom:20px;}
  .dr_love_search .f2 p{
    font-size:18px;
    color:#493428;
    line-height:40px;
  }
  .dr_love_search .f2 .u_line{
    width:33px;
    border-bottom:2px solid #8f7e74;
    margin:20px auto 0;
  }
  .id_input{
    position:relative;
    width:280px;background:#8b766c;
    margin:20px auto 0;}
  .id_input input{
    width:222px;
    background:#8b766c;
    border:0;color:#fff;
    padding:15px 0;
    text-align:center;
  }
  /* 修改placeholder颜色及兼容 */
  .id_input input::-webkit-input-placeholder{color:#fff;}
  input::-moz-placeholder {
    /* Mozilla Firefox 19+ */
    color: #fff;
  }
  input:-moz-placeholder {
    /* Mozilla Firefox 4 to 18 */
    color: #fff;
  }
  input:-ms-input-placeholder {
    /* Internet Explorer 10-11 */
    color: #fff;
  }
  .id_input a{
    position:absolute;
    width:22px;height:22px;
    top:11.5px;right:16px;
    background:url(../../public//index/ico-wseach.png) no-repeat;
  }
  .dr_family{margin-top:16px;}
  .family_left{float:left;width:694px;}
  .family_right{float:right;width:650px;margin-left:16px;}
  .family_item{position:relative;overflow:hidden;margin-bottom:16px;}
  .family_left .family_item:first-child{margin-bottom:18px;}
  .family_item img{transition:transform .5s;}
  .family_item img:hover{transform:scale(1.1);}
  .family_item p{
    position:absolute;
    bottom:38px;right:40px;
    font-size:18px;
    color:#333;
  }
  .family_left .family_item:first-child p{left:40px;right:auto;}
  .city_shop{width:551px;height:500px;background:#ded8d2;text-align:center;}
  .city_shop>img{margin-top:80px;}
  .input_city{
    width:336px;height:30px;
    position:relative;
    background:#8b766c;
    color:#ded8d2;
    line-height:30px;
    text-align:left;
    margin:56px auto 0;
    padding:6px 14px;
  }
  .input_city span{
    display:inline-block;width:116px;
    font-size:14px;text-align:center;
    cursor:pointer;
  }
  .input_city input{
    width:160px;height:30px;
    background:url(../../public/index/ico-gps1.png) no-repeat left center;
    border:0;
    color:#ded8d2;
    padding-left:20px;
  }
  /* 设置placeholder颜色 */
  .input_city input::-webkit-input-placeholder{color:#ded8d2;}
  .input_city a{
    position:absolute;
    right:20px;top:10px;
  }
  .dr_shop .order_btn{
    display:block;
    width:360px;height:44px;
    background:#eee8e2;
    color:#8b766c;
    text-align:center;
    line-height:44px;
    margin:29px auto 0;
  }
  .dr_shop .order_btn:hover{background:#9b745c;color:#fff;}
  .dr_other{
    display:flex;
    justify-content:space-between;
    margin-top:16px;
  }
  .dr_other a{position:relative;}
  .dr_other a p{
    width:100%;
    position:absolute;
    left:0;top:50%;
    margin-top:-9px;
    font-size:18px;
    color:#fff;
    line-height:18px;
    text-align:center;
  }
  .paris_video{
    display:none;
    position:fixed;
    left:0;top:0;
    width:100%;height:100%;
    background-color:rgba(0,0,0,0.5);
    z-index:9999;
  }
  .paris_video>div{
    position:absolute;
    top:20%;left:50%;
    margin-left:-600px;
  }
  .paris_video video{display:block}
  .paris_video .close{
    position:absolute;
    width:40px;height:40px;
    right:0;top:-40px;
    background:url(../../public/index/sp_close.jpg) no-repeat;
  }
</style>
