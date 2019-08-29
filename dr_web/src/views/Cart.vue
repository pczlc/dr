<template>
  <div class="w-1360">
    <div class="dr_header">
      <router-link to="/" class="logo">
        <img src="../../public/img/index/logo.png">
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
    <div class="main">
      <div class="cart_flow">
        <h2>购物车</h2>
        <div class="cart_steps">
          <div class="active">
            <span>1</span>
            <p>1.我的购物车</p>
          </div>
          <div>
            <span>2</span>
            <p>2.签署真爱协议</p>
          </div>
          <div>
            <span>3</span>
            <p>3.填写订单信息</p>
          </div>
          <div>
            <span>4</span>
            <p>4.付款 完成购物</p>
          </div>
        </div>
      </div>
      <div class="cart">
        <div class="cart_top">
          <span class="checkAll">
            <input id="checkAll1" type="checkbox" v-model="checkAll">
            <label for="checkAll1">全选</label>
          </span>
          <span>商品</span>
          <span class="space"></span>
          <span>价格</span>
          <span>操作</span>
        </div>
        <div class="cart_list">
          <div v-for="(item,i) of pros" :key="i" class="cart_item">
            <span class="check_img">
              <input type="checkbox" :checked="checkAll">
              <img :src="`http://127.0.0.1:5050/${item.ring_img}`">
            </span>
            <span class="title">{{item.ring_title}}</span>
            <span class="choose">
              <span>是否需要艺术字</span>
              <select>
                <option>否</option>
                <option>是</option>
              </select>
              <span class="btns">
                <input type="text" placeholder="限输入5个汉字或10个字母">
                <a href="javascript:;">♥</a>
                <a href="javascript:;">&</a>
                <a href="javascript:;">确定</a>
              </span>
            </span>
            <span class="price">￥{{item.ring_price}}</span>
            <span class="remove">
              <a href="javascript:;" @click="delItem(i)">删除</a>
            </span>
          </div>
          <div class="shopping_promise">
            <span>支持全球配送，真爱体验店取货</span>
            <span>全程保价 无风险</span>
            <span>支付安全保障 安全支付系统采用SSL加密</span>
          </div>
        </div>
        <div class="cart_bottom">
          <div class="buy_left">
            <input id="checkAll2" type="checkbox" v-model="checkAll">
            <label for="checkAll2">全选</label>
            <router-link to="/Products">继续购物</router-link>
          </div>
          <div class="buy_right">
            <span>已选 <span class="f_red">{{pros.length}}</span> 件商品</span>
            <span>总价：<span class="f_red">￥{{totalPrice}}</span></span>
            <span>免运费</span>
            <a class="buy_btn" href="javascript:;">验证并购买</a>
          </div>
        </div>
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
      userName:"",
      pros:[],
      checkAll:false
    }
  },
  methods:{
    getCart(){
      this.axios.get("user/getSession").then(res=>{
        var result=res.data;
        if(result.code==1){
          this.userName=result.data.user_name;
          var uid=result.data.uid;
          this.axios.get("cart/list",{params:{uid}}).then(res=>{
            if(res.data.code==1){
              this.pros=res.data.data;
            }
          })
        }else{
          this.$router.push("/Login");
        }
      })
    },
    exit(){
      this.axios.get("user/exit");
      this.$router.push("/");
    },
    delItem(i){
      if(!confirm("确定删除吗?")){
        //提示删除，如果取消则不执行
        return;
      }
      var ring_id=this.pros[i].ring_id;
      var ridObj=this.qs.stringify({ring_id});//简写对象解构
      this.axios.post("cart/delItem",ridObj).then(res=>{
        if(res.data.code==1){
          this.getCart();
        }
      })
    }
  },
  created(){
    this.getCart();
  },
  computed:{
    //计算总价
    totalPrice(){
      var sum=0;
      for(var item of this.pros){
        sum+=item.ring_price;
      }
      return sum;
    }
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
    background:url(../../public/img/header/bottom.png) no-repeat right center;
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
    background:url(../../public/img/index/phone.png) no-repeat left center;
    margin:0 15px;
  }
  .help{
    color:#8d8d8d;
    padding-right:10px;
    background:url(../../public/img/login/bread_right.png) no-repeat right center;
  }
  .help:hover{color:#bf967c;}
  .main{margin-top:40px;}
  .cart_flow{
    display:flex;
    justify-content:space-between;
  }
  .cart_flow h2{
    height:18px;
    line-height:18px;
    border-left:2px solid #97847b;
    font-size:18px;
    font-weight:400;
    color:#333;
    padding-left:15px;
  }
  .cart_steps{
    display:flex;
    font-size:12px;
    color:#cbcbcb;
    text-align:center;
  }
  .cart_steps>div{width:198px;}
  .cart_steps span{
    display:block;
    width:100%;
    line-height:23px;
    background:#cbcbcb url(../../public/img/aside/steps_bg.png) no-repeat center;
    color:#fff;
    margin-bottom:10px;
  }
  .cart_steps>div.active>span{background-color:#8b766c;}
  .cart_steps>div.active>p{color:#8b766c;}
  .cart_top{
    display:flex;
    border:1px solid #e0e0e0;
    background:#f3f3f3;
    font-size:12px;
    color:#666;
    text-align:center;
    margin:20px 0;
  }
  .cart_top>span{width:15%;padding:15px 0;}
  .cart_top>.space{width:40%;}
  .cart_top>.checkAll{
    padding-left:20px;
    text-align:left;
  }
  #checkAll1{
    vertical-align:middle;
    margin-right:4px;
    margin-top:-2px;
  }
  .cart_item{
    display:flex;
    align-items:center;
    border:1px solid #e0e0e0;
    background:#fcfcfc;
    font-size:12px;
    margin:20px 0;
    padding:15px 0;
  }
  .cart_item img{
    width:100px;height:100px;
  }
  .check_img{
    display:flex;
    align-items:center;
    width:10%;
    padding-left:15px;
    box-sizing:border-box;
  }
  .check_img>input{margin-right:20px;}
  .title{
    width:25%;
    color:#8b766c;
    font-weight:700;
    text-align:center;
  }
  .choose{
    width:35%;
    display:flex;
    align-items:center;
    color:#666;
  }
  .choose>select{
    height:30px;
    border:1px solid #b0b0b0;
    border-radius:3px;
    box-sizing:border-box;
    line-height:28px;
    padding-left:8px;
    margin:0 6px;
  }
  .btns{
    display:flex;
    align-items:center;
    border:1px solid #b0b0b0;
    border-radius:3px;
  }
  .btns>input{
    width:146px;
    border:0;
    font-size:12px;
    padding:7px 0 7px 4px;
  }
  .btns>a{
    height:28px;
    width:25px;
    color:#8b766c;
    text-align:center;
    line-height:28px;
    border-left:1px solid #b0b0b0;
  }
  .btns>a:last-child{width:36px;}
  .price{
    width:15%;
    font-size:13px;
    font-weight:700;
    color:#ff5d5b;
    text-align:center;
  }
  .remove{width:15%;text-align:center;}
  .remove>a{color:#8b766c;}
  .shopping_promise{
    font-size:12px;
    color:#666;
    text-align:right;
  }
  .shopping_promise>span{
    display:inline-block;
    height:20px;
    line-height:20px;
    padding-left:20px;
    margin-left:25px;
    background:url(../../public/img/cart/ico-service.png) no-repeat;
  }
  .shopping_promise>span:nth-child(2){background-position:0 -35px;}
  .shopping_promise>span:nth-child(3){background-position:0 -70px;}
  .cart_bottom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:10px;
    border:1px solid #f1f1f1;
    background:#f8f8f8;
    font-size:12px;
    color:#666;
  }
  .buy_left{padding-left:15px;}
  #checkAll2{margin-right:4px;margin-top:-2px;vertical-align:middle;}
  .buy_left>a{
    color:#666;
    margin-left:15px;
  }
  .buy_left>a:hover{color:#8b766c;}
  .buy_right{height:50px;line-height:50px;}
  .buy_right>span{margin-right:15px;}
  .f_red{color:#ff5d5b;font-size:13px;font-weight:700;}
  .buy_btn{
    display:inline-block;
    width:160px;height:50px;
    line-height:50px;
    text-align:center;
    background:#a98f83;
    font-size:14px;
    font-weight:700;
    color:#fff;
    margin-left:30px;
  }
  .buy_btn:hover{background:#8b766c;}
</style>
