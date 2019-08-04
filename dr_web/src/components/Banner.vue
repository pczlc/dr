<template>
  <!-- 轮播图 -->
  <div class="dr_banner">
    <div id="img_change">
      <router-link to="Products" v-for="(elem,i) of imgList" :key="i" :class="status[i]">
        <img :src="`http://127.0.0.1:5050/${elem.img}`">
      </router-link>
    </div>
    <!-- 轮播图翻页 -->
    <a class="prev_button" @click="prevBtn" href="javascript:;"></a>
    <a class="next_button" @click="nextBtn" href="javascript:;"></a>
    <!-- 轮播图指示器 -->
    <ul class="banner_indicators">
      <li v-for="(elem,i) of imgList" :key="i" :class="status[i]"></li>
    </ul>
  </div>
</template>

<script>
export default {
  data(){
    return {
      imgList:[],
      status:[],
      interval:null
    }
  },
  methods:{
    nextImg(){
      //遍历数组，判断有active属性，下一项赋值为active，并清除当前的active
      for(var i=0;i<this.status.length;i++){
        if(this.status[i]=="active"){
          if(i<this.status.length-1){
            this.status[i+1]="active";
          }else{
            this.status[0]="active";
          }
          this.status[i]="";
          console.log(this.status)
          break;
        }
      }
    },
    prevBtn(){

    },
    nextBtn(){

    }
  },
  created(){
    this.axios.get("index/getBanner").then(res=>{
        this.imgList=res.data;
        //初始化保存状态的数组长度
        this.status.length=this.imgList.length;
        //第一项初始化为active
        this.status[0]="active";
        this.interval=setInterval(this.nextImg,3000);
    })
  }
}
</script>
<style scoped>
  .dr_banner{
    position:relative;
    overflow: hidden;
    height:620px;
    z-index:1;
  }
  #img_change>a{
    position: absolute;
    left:0;top:0;
    opacity:0;
    transition:all 1s linear;
    line-height:0;
    z-index:2
  }
  #img_change>a.active{opacity:1;}
  #img_change>a:first-child{opacity:1;}
  .prev_button,.next_button{
    position:absolute;
    width:24px;height:45px;
    background:url(../../public/index/ico-bannerBtn.png);
    top:50%;
    margin-top:-22.5px;
    z-index:3;
  }
  .prev_button{left:50px;}
  .next_button{right:50px;background-position-x:-25px;}
  .banner_indicators{
    position:absolute;
    display:flex;
    bottom:15px;
    margin-left: 50%; 
    margin-right: 50%; 
    cursor:pointer;
    z-index:3;
  }
  .banner_indicators li{
    width:10px;height:10px;
    background:#fff;
    border-radius:50%;
    margin:0 5px;
  }
  .banner_indicators li.active{background:#666;}
</style>
