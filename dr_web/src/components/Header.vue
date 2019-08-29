<template>
  <div class="dr_header">
    <!-- header上部分 -->
    <div class="header_top">
      <div>
        <img class="gps_icon" src="../../public/index/ico-gps.png" alt="">
        <span class="font_small font_main_color">成都</span>
        <a class="total_store font_small" href="javascript:;">全国店铺 ></a>
        <div class="float_r clear_after">
          <router-link v-show="!isLogin" to="/login" class="log_reg_btn font_small">注册/登录</router-link>
          <div v-show="isLogin" class="user">
            <a href="javascript:;">欢迎 {{userName}}</a>
            <div class="user_handle">
              <a href="javascript:;">我的订单</a>
              <a href="">购物车</a>
              <a href="javascript:;">我的收藏</a>
              <a href="javascript:;">个人中心</a>
              <a href="javascript" @click="exit">退出</a>
            </div>
          </div>
          <ul class="font_small">
            <li class="lan_chs">
              <a href="javascript:;">中文(简体)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </li>
            <li class="lan_choose">
              <a href="javascript:;">English</a>
              <a href="javascript:;">中文(繁體)</a>
            </li>
          </ul>
          <div class="d_inline_block b_slash">
              <img class="phone_icon" src="../../public/index/phone.png">
              <span class="font_small color_gray">400 01 13520</span>
          </div>
          <div class="d_inline_block b_slash">
              <a class="font_small color_gray" href="javascript:;">天猫旗舰店</a>
          </div>
        </div>
      </div>
      <div class="search_id">
        <input type="text" placeholder="请输入身份证号验证真爱承诺">
        <a class="search_icon" href="javascript:;"></a>
      </div>
      <div class="dr_logo">
        <router-link to="/"  class="a_img">
          <img  src="../../public/index/logo.png" alt="">
        </router-link>
      </div>
    </div>
    <!-- 导航栏 -->
    <div class="header_nav">
      <ul :class="`d_flex dr_nav ${navPosition}`">
        <li>
          <a href="javascript:;">DR</a>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_first">
            <div class="clear_after">
              <div class="navsuv_l float_l">
                <img src="../../public/index/drword.png" alt="">
                <p><a href="javascript:;">加入dr族</a></p>
              </div>
              <div class="navsuv_r float_l">
                <img src="../../public/index/adv_gift.jpg" alt="">
                <p><a href="javascript:;">DR福利商城</a></p>
              </div>
            </div>
          </div>
        </li>
        <li>
          <router-link to="/Products">求婚钻戒</router-link>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_second">
            <div class="clear_after d_flex">
              <div>
                <router-link to="/Products" class="a_img">
                  <img class="left_img" :src="`http://127.0.0.1:5050/${leftDft}`">
                </router-link>
              </div>
              <div class="dr_set">
                <p v-for="(elem,i) of hlist.left" :key="i" @mouseover="changeImg('left',i)">
                  <router-link to="/Products">{{elem.hname}}</router-link>
                </p>
              </div>
              <div class="dr_set">
                <p v-for="(elem,i) of hlist.right" :key="i" @mouseover="changeImg('right',i)">
                  <router-link to="/Products">{{elem.hname}}</router-link>
                </p>
              </div>
              <div>
                <router-link to="/Products" class="a_img">
                  <img class="left_img" :src="`http://127.0.0.1:5050/${rightDft}`">
                </router-link>
              </div>
            </div>
          </div>
        </li>
        <li>
          <router-link to="/Products">结婚对戒</router-link>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_third clear_after">
            <div class="navsuv_l float_l clear_after">
              <div class="navsuv_list_f1">
                <h6>类型</h6>
                <p><router-link to="/Products">结婚对戒</router-link></p>
                <p><router-link to="/Products">男戒</router-link></p>
                <p><router-link to="/Products">结婚套装</router-link></p>
                <h6 class="h6_mt">浏览</h6>
                <p><router-link to="/Products">热销</router-link></p>
                <p><router-link to="/Products">新品</router-link></p>
              </div>
              <div class="navsuv_list_f1">
                <h6>系列</h6>
                <p><router-link to="/Products">DARRY RING系列</router-link></p>
                <p><router-link to="/Products">TOGETHER系列</router-link></p>
                <p><router-link to="/Products">ENDLESS LOVE系列</router-link></p>
                <p><router-link to="/Products">D-DESTINY系列</router-link></p>
                <p><router-link to="/Products">查看更多戒指</router-link></p>
              </div>
            </div>
            <div class="navsuv_r float_l">
              <router-link to="/Products" class="a_img">
                <img src="../../public/index/cpring.jpg" alt="">
              </router-link>
              <p>
                <router-link to="/Products">结婚对戒</router-link>
              </p>
            </div>
          </div>
        </li>
        <li>
          <router-link to="/Products">真爱礼物</router-link>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_fourth clear_after">
            <div class="navsuv_l float_l clear_after">
              <div class="navsuv_list_f1">
                <h6>送礼对象</h6>
                <p><router-link to="/Products">浪漫女士</router-link></p>
                <p><router-link to="/Products">尊贵男士</router-link></p>
                <h6 class="h6_mt">真爱礼物</h6>
                <p><router-link to="/Products">热销礼物</router-link></p>
              </div>
              <div class="navsuv_list_f1">
                <h6>类型</h6>
                <p><router-link to="/Products">套链/项链/吊坠</router-link></p>
                <p><router-link to="/Products">手链/手镯</router-link></p>
                <p><router-link to="/Products">耳环/耳钉/耳线</router-link></p>
                <p><router-link to="/Products">冠冕</router-link></p>
                <p><router-link to="/Products">配饰</router-link></p>
                <p><router-link to="/Products">查看全部真爱礼物</router-link></p>
              </div>
            </div>
            <div class="navsuv_r float_l">
              <router-link to="/Products" class="a_img">
                <img src="../../public/index/jnr.jpg" alt="">
              </router-link>
              <p>
                <router-link to="/Products">真爱礼物</router-link>
              </p>
            </div>
          </div>
        </li>
        <li><a href="javascript:;">钻戒定制</a></li>
        <li><a href="javascript:;">真爱体验店</a></li>
        <li>
          <a href="javascript:;">DR品牌文化</a>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_seventh clear_after">
              <div class="navsuv_l float_l">
                <a class="a_img" href="javascript:;">
                  <img src="../../public/index/15336107475b690afbba109.jpg" alt="">
                </a>
                <p>
                  <a href="javascript:;">品牌文化</a>
                </p>
              </div>
              <div class="navsuv_r float_l">
                <a class="a_img" href="javascript:;">
                  <img src="../../public/index/15196164725a9381d8e90f4.jpg" alt="">
                </a>
                <p>
                  <a href="javascript:;">明星推荐</a>
                </p>
              </div>
          </div>
        </li>
        <li>
          <a href="javascript:;">探索DR</a>
          <!-- 隐藏下拉 -->
          <div class="dr_navsuv dr_navsuv_eighth clear_after">
              <div class="navsuv_l float_l">
                <a class="a_img" href="javascript:;">
                  <img src="../../public/index/1488350702.jpg" alt="">
                </a>
                <p>
                  <a href="javascript:;">品牌文化</a>
                </p>
              </div>
              <div class="navsuv_r float_l">
                <a class="a_img" href="javascript:;">
                  <img src="../../public/index/1488352096.jpg" alt="">
                </a>
                <p>
                  <a href="javascript:;">明星推荐</a>
                </p>
              </div>
          </div>
        </li>
      </ul>
    </div>
  </div> 
</template>
<script>
export default {
  data(){
    return {
      userName:"",
      isLogin:false,
      hlist:{},
      leftDft:"",
      rightDft:"",
      navPosition:[""]
    }
  },
  methods:{
    getSeesion(){
      this.axios.get("user/getSession").then(res=>{
        var result=res.data;
        if(result.code==1){
          this.userName=result.data.user_name;
          this.isLogin=true;
        }
      })
    },
    exit(){
      this.axios.get("user/exit");
      this.isLogin=false;
    },
    loadHeader(){
      this.axios.get("product/headerImg").then(res=>{
        this.hlist=res.data;
        this.leftDft=res.data.left[0].img;
        this.rightDft=res.data.right[0].img;
      });
    },
    changeImg(location,i){
      if(location=="left"){
        this.leftDft=this.hlist.left[i].img;
      }else{
        this.rightDft=this.hlist.right[i].img;
      }
    },
    // 页面滚动超过导航栏时，导航栏固定定位
    navFixed(){
      //定义一个变量用于保存定时器
      var timer;
      // 先获取导航栏离顶部距离保存至变量中
      var nav=document.getElementsByClassName("dr_nav")[0];
      var h=nav.offsetTop;
      window.onscroll=()=>{
        if(timer!=="undefined"){
          clearTimeout(timer)
        }
        setTimeout(()=>{
          // 获取页面滚动过的高度，考虑到兼容性问题
          var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
          if(scrollTop>=h){
            this.navPosition = "fixed";
          }else{
            this.navPosition = "";
          }
        },1000/60)
      }
    }
  },
  created(){
    this.loadHeader();
    this.getSeesion();
  },
  mounted(){
    this.navFixed();
  }
}
</script>
<style scoped>
  .dr_header{
    width:1360px;
    margin:0 auto;
  }
  .dr_header::before{
    content:"";
    display:table;
  }
  .header_top{
    height:140px;
    position:relative;
    margin-top:24px;
  }
  .gps_icon{ vertical-align:middle;}
  .font_small.font_main_color{line-height:20px;}
  a.total_store{margin-left:26px;color:#797979;}
  .dr_header{background:#fff;}
  .header_top div.float_r{line-height:20px;}
  .log_reg_btn{
    display:inline-block;
    height:20px;
    background:#8b766c;
    color:#fff;
    padding:0 14px;
  }
  .header_top div.float_r ul{
    display:inline-block;
    background:#fff;
    padding:0 10px;
  }
  .lan_chs{
    background:url(../../public/index/bottom.png) no-repeat right center;
  }
  .lan_choose{
    position:absolute;
    z-index:2;
    height:0px;
    background:#fff;
    overflow:hidden;
    transition:all 0.3s linear; 
  }
  .lan_chs:hover+li{height:40px;}
  .lan_choose:hover{height:40px;}
  .header_top div.float_r ul a{display:block;color:#8d8d8d;}
  .header_top div.float_r ul a:hover{color:#bf967c;}
  .phone_icon{vertical-align:middle;}
  .color_gray{color:#8d8d8d;}
  a.color_gray:hover{color:#bf967c;}
  .b_slash:before{
    content:"/";
    display:inline-block;
    font-size:12px;
    color:#8d8d8d;
    padding:0 5px;
  }
  .search_id{
    position:absolute;
    top:30px;right:0;
  }
  .search_id input{
    width:200px;
    border:1px solid #d7d7d7;
    font-size:13px;
    padding:6px 4px 6px 10px;
    z-index:1;
  }
  .dr_logo{
    position:absolute;
    top:22px;left:50%;
    margin-left:-55.5px;
  }
  .search_icon{
    position:absolute;
    width:22px;height:23px;
    top:3px;right:4px;
    background:url(../../public/index/ico-seach.png) no-repeat center center;
  }
  .header_nav{height:54px;}
  .dr_nav{
    position:relative;
    height:54px;
    background:#fff;
    z-index:99;
  }
  .dr_nav.fixed{
    position:fixed;
    top:0;
    border-bottom:1px solid #666;
  }
  .dr_nav>li>a{
    display:inline-block;
    width:170px;
    text-align:center;
    color:#333;
    font-size:12px;
    line-height:54px;
  }
  .dr_nav a:hover{color:#bf967c !important;}
  .dr_navsuv{
    display:none;
    position:absolute;
    left:0;
    box-sizing:border-box;
    min-width:1360px;
    min-height:230px;
    background:#fff;
    padding:0 180px 30px;
    z-index:7;
  }
  .dr_nav>li>a:hover+div{display:block;}
  .dr_navsuv:hover{display:block;}
  .navsuv_l{
    width:497px;min-height:200px;
    background:url(../../public/index/subNav_line.png) no-repeat right center;
    background-size:auto 90%;
    padding-top:30px;
    padding-right:5px;
    text-align: center;
  }
  .navsuv_r{
    width:498px;min-height:200px;
    padding-top:30px;
    text-align: center;
  }
  .dr_navsuv_first .navsuv_l p{margin-top:26px;}
  .dr_navsuv_first .navsuv_r p{margin-top:6px;}
  .dr_navsuv_first .navsuv_l p a{
    display:inline-block;
    height:29px;line-height:29px;
    background:url(../../public/index/black_icon.png) no-repeat right center;
    color:#5e5e61;
    padding-right:40px;
  }
  .dr_navsuv_first .navsuv_r p a{color:#5e5e61;}
  .dr_navsuv_second img{
    width:200px;
    margin-top:20px;
  }
  .dr_navsuv_second .dr_set{margin-top:12px;}
  .dr_navsuv_second .dr_set a{
    display:block;
    width:190px;height:42px;
    border-bottom:1px solid #dbdbdb;
    font-size:12px;
    color:#5e5e61;
    line-height:42px;
    text-align:center;
  }
  .dr_navsuv_second .dr_set a:hover,.navsuv_list_f1 p a:hover{
    color:#bf967c;
    border-bottom-color:#afafb0;
  }
  .dr_navsuv_third .navsuv_list_f1,.dr_navsuv_fourth .navsuv_list_f1{
    float:left;
    margin-left:64px;
    text-align:left;
  }
  .navsuv_list_f1 h6{
    font-size:14px;
    font-weight:400;
    color:#493428;
    line-height:14px;
  }
  .navsuv_list_f1 p{
    line-height:18px;
    margin-top:23px;
  }
  .navsuv_list_f1 p a{
    display:inline-block;
    width:112px;
    border-bottom:1px solid #dbdbdb;
    font-size:12px;
    color:#939393;
  }
  .navsuv_list_f1 .h6_mt{
    margin-top:28px;
  }
  .navsuv_list_f1:last-child{
    margin-left:106px;
  }
  .dr_navsuv_third .navsuv_r p,.dr_navsuv_fourth .navsuv_r,
  .dr_navsuv_seventh p,.dr_navsuv_eighth p{
    margin-top:6px;
    line-height:24px;
    color:#5e5e61;
  }
  .dr_navsuv_third .navsuv_r p a,.dr_navsuv_fourth .navsuv_r p a,.dr_navsuv_seventh p a,.dr_navsuv_eighth p a{
    color:#5e5e61;
  }
  .user{
    display:inline-block;
    height:20px;
    line-height:20px;
    position:relative;
    margin-right:6px;
  }
  .user a{display:inline-block;font-size:12px;line-height:20px;}
  .user>a{
    padding:0 15px;
    background:url(../../public/header/bottom.png) no-repeat right center;
    color:#9b745c;
  }
  .user_handle{
    position:absolute;
    width:90px;
    box-sizing:border-box;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    border:1px solid #f1f1f1;
    background:#fff;
    padding:8px 17px;
    left:50%;top:20px;
    margin-left:-45px;
    display:none;
  }
  .user_handle>a{color:#bbb;}
  .user_handle>a:hover{color:#9b745c;}
  .user>a:hover+div{display:block;}
  .user_handle:hover{display:block;}
</style>
