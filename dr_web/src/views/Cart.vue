<template>
  <div class="w-1360">
    <div class="dr_header">
      <router-link to="/" class="logo">
        <img src="../../public/index/logo.png">
      </router-link>
      <div class="header_r">
        <div class="user">
          <a href="javascript:;">欢迎 {{userName}}</a>
          <div class="user_handle">
            <a href="javascript:;">我的订单</a>
            <a href="">购物车</a>
            <a href="javascript:;">我的收藏</a>
            <a href="javascript:;">个人中心</a>
            <a href="javascript" @click="exit">退出</a>
          </div>
        </div>
        <span class="phone">400 01 13520</span>
        <a class="help" href="javascript:;">帮助中心</a>
      </div>
    </div>
    <footer-vue></footer-vue>
    <aside-vue></aside-vue>
  </div>
</template>

<script>
import FooterVue from "../components/Footer.vue"
import AsideVue from "../components/Aside.vue"
export default {
  data(){
    return {
      userName:""
    }
  },
  methods:{
    getSeesion(){
      this.axios.get("user/getSession").then(res=>{
        if(res.data.code==1){
          this.userName=res.data.user_name;
        }else{
          this.$router.push("/Login");
        }
      })
    },
    exit(){
      this.axios.get("user/exit");
      this.$router.push("/");
    }
  },
  created(){
    this.getSeesion();
  },
  components:{
    FooterVue,
    AsideVue
  }
}
</script>

<style scoped>
  .dr_header{
    height:80px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid #666;
  }
  .logo{margin-left:12px;}
  .logo>img{height:60px;}
  .header_r{margin-right:12px;font-size:12px;}
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
  .phone{
    color:#8d8d8d;
    padding-left:17px;
    background:url(../../public/index/phone.png) no-repeat left center;
    margin:0 15px;
  }
  .help{
    color:#8d8d8d;
    padding-right:10px;
    background:url(../../public/login/bread_right.png) no-repeat right center;
  }
  .help:hover{color:#bf967c;}
</style>
