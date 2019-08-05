<template>
  <!-- 轮播图 -->
  <div class="dr_banner">
    <div id="img_change">
      <router-link to="Products" v-for="(elem,i) of imgList" :key="i" :class="elem.status">
        <img :src="`http://127.0.0.1:5050/${elem.img}`">
      </router-link>
    </div>
    <!-- 轮播图翻页 -->
    <a class="prev_button" @click="changeBtn(-1)" href="javascript:;"></a>
    <a class="next_button" @click="changeBtn" href="javascript:;"></a>
    <!-- 轮播图指示器 -->
    <ul class="banner_indicators">
      <li v-for="(elem,i) of imgList" :key="i" :class="elem.status" @click="moveTo(i)"></li>
    </ul>
  </div>
</template>

<script>
export default {
  data(){
    return {
      imgList:[],
      interval:null
    }
  },
  methods:{
    load(){
      this.axios.get("index/getBanner").then(res=>{
          var list=res.data;
          for(var elem of list){
            elem.status="";
          }
          //第一项初始化为active
          list[0].status="active";
          this.imgList=list;
          //初始时启动计时器
          this.interval=setInterval(this.changeImg,4000);
      });
    },
    changeImg(i){
      //将重复使用的变量取个别名
      var imgs=this.imgList;
      var len=this.imgList.length;
      //为-1跳到上一张，否则跳到下一张
      if(i==-1){
        //遍历数组，判断有active属性，下一项赋值为active，并清除当前的active
        for(var i=0;i<len;i++){
          if(imgs[i].status=="active"){
            imgs[i].status="";
            if(i==0){
              imgs[len-1].status="active";
            }else{
              imgs[i-1].status="active";
            }
            //更改数组的值，页面不会发生改变，通过拷贝数组改变地址的方式实现页面更新
            Object.assign(this.imgList,imgs);
            break;
          }
        }
      }else{
        for(var i=0;i<len;i++){
          if(imgs[i].status=="active"){
            imgs[i].status="";
            if(i<len-1){
              imgs[i+1].status="active";
            }else{
              imgs[0].status="active";
            }
            //更改数组的值，页面不会发生改变，通过拷贝数组改变地址的方式实现页面更新
            Object.assign(this.imgList,imgs);
            break;
          }
        }
      }
    },
    changeBtn(i){
      clearInterval(this.interval);
      this.changeImg(i);
      this.interval=setInterval(this.changeImg,4000);
    },
    moveTo(i){
      clearInterval(this.interval);
      for(var j=0;j<this.imgList.length;j++){
        if(this.imgList[j].status="active"){
          this.imgList[j].status="";
        }
      }
      this.imgList[i].status="active";
      Object.assign(this.imgList,this.imgList);
      this.interval=setInterval(this.changeImg,4000);
    }
  },
  created(){
    this.load();
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
