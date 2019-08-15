<template>
  <div class="w-1360">
    <header-vue></header-vue>
    <div class="msg">
      <p>对不起，您访问的页面忙着求婚去了......</p>
      <a href="javascript:;" @click="toIndex">{{time}}秒后返回首页</a>
    </div>
    <footer-vue></footer-vue>
  </div>
</template>

<script>
import HeaderVue from "../components/Header.vue"
import FooterVue from "../components/Footer.vue"
export default {
  data(){
    return {
      time:5,
      t:null
    }
  },
  methods:{
    toIndex(){
      clearInterval(this.t);
      this.$router.push("/");
    },
    interval(){
      this.t=setInterval(()=>{
      this.time-=1;
      if(this.time<1){
        clearInterval(this.t);
        this.$router.push("/");
        }
      },1000);
    }
  },
  mounted(){
    this.interval();
  },
  components:{
    HeaderVue,
    FooterVue
  }
}
</script>
<style>
  .msg{
    font-size:16px;
    color:rgb(220,87,18);
    font-weight:600;
    text-align:center;
    margin-top:40px;
  }
  .msg>a{
    display:inline-block;
    margin-top:10px;
    text-decoration:underline;
    color:rgb(220,87,18);
  }
</style>
