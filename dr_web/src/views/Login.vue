<template>
  <div class="w-1360">
    <div class="dr_header">
      <router-link to="/" class="logo">
        <img src="../../public/img/index/logo.png">
      </router-link>
      <div class="header_r">
        <router-link to="/" class="log_reg_btn">注册/登录</router-link>
        <span class="phone">400 01 13520</span>
        <a class="help" href="javascript:;">帮助中心</a>
      </div>
    </div>
    <div class="main">
      <img class="login_bg" src="../../public/img/login/login_bg.jpg">
      <div class="log_reg_fun">
        <div>
          <div class="login_div" v-show="show">
            <div class="title">
              <h3>登录</h3>
              <a href="javascript:;" @click="changeDiv">去注册</a>
            </div>
            <div class="login_input">
              <div v-show="logErrDis" class="errMsg">{{logErrMsg}}</div>
              <input v-model="logUname" class="uname_input" type="text" placeholder="请输入您的邮箱/手机号">
              <input v-model="logUpwd" class="upwd_input" type="password" placeholder="请输入密码">
              <p class="remember">
                <span>
                  <input id="is_remember" type="checkbox">
                  <label for="is_remember">记住密码</label>
                </span>
                <a href="javascript:;">忘记密码?</a>
              </p>
              <a class="login_btn" href="javascript:;" @click="login">登录</a>
            </div>
          </div>
          <div class="reg_div" v-show="!show">
            <div class="title">
              <h3>注册</h3>
              <a href="javascript:;" @click="changeDiv">去登录</a>
            </div>
            <div class="login_input">
              <div v-show="regErrDis" class="errMsg">{{regErrMsg}}</div>
              <input v-model="regUname" class="uname_input" type="text" placeholder="请输入您的邮箱/手机号">
              <input v-model="regUpwd" class="upwd_input" type="password" placeholder="请输入6~10位字母和数字密码">
              <div class="agree">
                <input id="agree" type="checkbox" v-model="regAgree">
                <label for="agree">同意Darry Ring用户</label>
                <a href="javascript:;">注册协议和隐私条款</a>
              </div>
              <a class="login_btn" href="javascript:;" @click="register">注册</a>
            </div>            
          </div>
        </div>
        <div class="login_bottom">
          <p>第三方账户登陆</p>
          <a href="javascript:;"></a>
          <a href="javascript:;"></a>
          <a href="javascript:;"></a>
          <a href="javascript:;"></a>
        </div>
      </div>
    </div>
    <footer-vue></footer-vue>
  </div>
</template>
<script>
import FooterVue from '../components/Footer.vue'
export default {
  data(){
    return {
      show:true,regAgree:false,
      logErrDis:false,logErrMsg:"",logUname:"",logUpwd:"",
      regErrDis:false,regErrMsg:"",regUname:"",regUpwd:"",
    }
  },
  methods:{
    changeDiv(){
      this.show=!this.show;
    },
    login(){
      var uname=this.logUname;
      var upwd=this.logUpwd;
      if(uname==""){
        this.logErrDis=true;
        this.logErrMsg="用户名不能为空";
        return;
      }
      if(upwd==""){
        this.logErrDis=true;
        this.logErrMsg="密码不能为空";
        return;
      }
      this.axios.get("user/login",{
        params:{uname,upwd}
      }).then(res=>{
        if(res.data.code==-1){
          this.logErrDis=true;
          this.logErrMsg="用户名或密码错误";
        }else{
          history.back();
        }
      })
    },
    register(){
      var uname=this.regUname;
      var upwd=this.regUpwd;
      var agree=this.regAgree;
      if(uname==""){
        this.regErrDis=true;
        this.regErrMsg="用户名不能为空";
        return;
      }
      if(upwd==""){
        this.regErrDis=true;
        this.regErrMsg="密码不能为空";
        return;
      }
      if(!agree){
        this.regErrDis=true;
        this.regErrMsg="请阅读并同意用户注册相关协议";
        return;
      }
      var reg1=/^((\d{11})|([a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)+))$/i;
      var reg2=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-z]{6,10}$/i;
      if(!reg1.test(uname)){
        this.regErrDis=true;
        this.regErrMsg="用户名格式错误";
        return;
      }
      if(!reg2.test(upwd)){
        this.regErrDis=true;
        this.regErrMsg="密码格式错误";
        return;
      }
      var userObj=this.qs.stringify({uname,upwd});//简写对象解构
      this.axios.post("user/register",userObj).then(res=>{
        var result=res.data;
        if(result.code==-1){
          this.regErrDis=true;
          this.regErrMsg="该手机号或邮箱已存在";
        }else{
          //登录账户并跳转至首页
          this.axios.get("user/login",{
            params:{uname,upwd}
          }).then(res=>{
            if(res.data.code==1){
              this.$router.push("/");
            }
          })
        }
      })
    }
  },
  components:{
    FooterVue
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
  .log_reg_btn{
    display:inline-block;
    height:20px;
    line-height:20px;
    background:#8b766c;
    color:#fff;
    padding:0 14px;
  }
  .phone{
    color:#8d8d8d;
    padding-left:17px;
    background:url(../../public/img/index/phone.png) no-repeat left center;
    margin:0 15px;
  }
  .help{
    color:#8d8d8d;
    padding-right:10px;
    background:url(../../public/img/login/bread_right.png) no-repeat right center;
  }
  .help:hover{color:#bf967c;}
  .main{position:relative;}
  .login_bg{width:100%;}
  .log_reg_fun{
    position:absolute;
    right:106px;top:66px;
    width:312px;
    background:#fff;
    box-shadow:0 0 8px #ccc;
    padding-bottom:8px;
  }
  .log_reg_fun>div:first-child{padding:14px 30px 0px;}
  .title{
    position:relative;
    height:38px;
    text-align:center;
    line-height:38px;
  }
  .title>h3{font-size:18px;font-weight:normal;color:#9b745c;}
  .title>a{
    position:absolute;
    right:4px;top:2px;
    font-size:12px;
    color:#9b745c;
    text-decoration:underline;
  }
  .login_input{
    display:flex;
    flex-direction:column;
    align-items:center;
  }
  .uname_input,.upwd_input{
    width:100%;height:38px;
    border:1px solid #e6e6e6;
    border-radius:4px;
    background:url(../../public/img/login/ico-uinput.png) no-repeat;
    padding-left:38px;
    box-sizing:border-box;
    margin-top:12px;
  }
  .uname_input{background-position:12px 12px;}
  .upwd_input{background-position:12px -24px;}
  .remember{
    display:flex;
    width:100%;height:16px;
    justify-content:space-between;
    align-items:center;
    margin-top:8px;
    font-size:12px;
    color:#888;
  }
  .remember>span{line-height:14px;}
  #is_remember{vertical-align:middle;margin-right:4px;}
  .remember>a{color:#888;}
  .remember>a:hover{color:#9b745c;}
  .login_btn,.reg_btn{
    width:100%;height:38px;
    border:1px solid #8b766c;
    color:#8b766c;
    text-align:center;
    line-height:38px;
    margin-top:20px;
  }
  .login_btn:hover,.reg_btn:hover{
    color:#fff;
    background-color:#8b766c;
  }
  .login_bottom{margin-top:50px;text-align:center;}
  .login_bottom>p{
    background:url(../../public/img/login/otherLoginHr.png) no-repeat center center;
    font-size:12px;
    color:#8b766c;
  }
  .login_bottom>a{
    display:inline-block;
    width:21px;height:16px;
    background:url(../../public/img/login/ico-otherLogin.png) no-repeat;
    margin:14px 8px 10px;
  }
  .login_bottom>a:nth-child(3){
    background-position-x:-42px;
  }
  .login_bottom>a:nth-child(4){
    background-position-x:-87px;
  }
  .login_bottom>a:nth-child(5){
    background-position-x:-130px;
  }
  .login_bottom>a:hover{background-position-y:-27px;}
  .agree{
    font-size:12px;
    color:#888;
    margin-top:8px;
  }
  #agree{vertical-align:middle;}
  .agree>a{color:#9b745c}
  .errMsg{
    box-sizing:border-box;
    width:100%;
    padding:4px 0 4px 25px;
    background:#fff2f2 url(../../public/img/login/ico-error.png) no-repeat 4px center;
    border:1px solid #ff7373;
    font-size:12px;
    color:#666;
    margin-bottom:-10px;
  }
</style>
