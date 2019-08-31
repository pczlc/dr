<template>
  <div class="ring_imgs float_l">
    <div>
      <div class="md_img" @mouseover="showLg" @mouseleave="hideLg">
        <div class="img_item">
          <img
          v-for="(img,i) of imgs" 
          :src="img" 
          :key="i"
          :class="status[i]">
        </div>
        <!-- 灰色滑块上面覆盖一层透明背景，防止闪烁 -->
        <div class="tr_bg" @mousemove="moveLg" v-show="canMove"></div>
        <div class="gray_bg" v-show="divDis"></div>
      </div>
      <!-- 背景图可能为透明图片，需要白色背景 -->
      <div class="white_bg" v-show="divDis">
        <img class="lg_img" src="" />
      </div>
    </div>
    <div class="sm_img">
      <span class="prev_btn visible" @click="changeBtn(-1)"></span>
      <span class="next_btn visible" @click="changeBtn(1)"></span>
      <div class="sm_img_overflow">
        <!-- 获取图片个数动态赋值宽，通过times赋值margin值 -->
        <ul class="sm_rings" :style="`width:${(imgs.length+2)*80}px;margin-left:-${times*80}px`">
          <li v-for="(img,i) of imgs" :key="i">
            <img :class="status[i]" :src="img" 
            @mouseover="showMd(i)">
          </li>
        </ul>
      </div>
    </div>
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
</template>
<script>
export default {
  data(){
    return {
      times:0, //记录左移次数
      divDis:false,
      canMove:true
    }
  },
  props:{
    imgs:{type:Array},
    status:{type:Array},
    showMd:{type:Function}
  },
  methods:{
    showLg(){
      this.divDis=true;
    },
    hideLg(){
      this.divDis=false;
    },
    moveLg(e){
      //获取滑块元素
      var gary_bg=document.getElementsByClassName("gray_bg")[0];
      var md=document.querySelector(".img_item>.active");
      //防止一进入页面就hover会报错，先判断是否加载完成
      if(md==null){return;}
      //替换大图对应的url
      var src=md.src;
      var lg=document.getElementsByClassName("white_bg")[0];
      lg.firstChild.src=src;
      //获取鼠标位置减去滑块一半的宽度
      var x=e.offsetX-75;
      var y=e.offsetY-75;
      //设置滑块的区域
      if(x<0){x=0;}else if(x>310){x=310;}
      if(y<0){y=0;}else if(y>310){y=310;}
      //将滑块位置换为鼠标位置
      gary_bg.style.left=x+"px";
      gary_bg.style.top=y+"px";
      //大图背景随鼠标位置改变
      lg.firstChild.style.left=-(920-300)/(460-150)*x+"px";
      lg.firstChild.style.top=-(920-300)/(460-150)*y+"px";
    },
    changeBtn(i){
      //图片左右移功能
      if(i==1){
        if(this.imgs.length-5-this.times>0){
          this.times++;
        }
      }else{
        if(this.times>0){
          this.times--;
        }
      }
    }
  },
  mounted(){
    var nav=document.getElementsByClassName("header_nav")[0];
    nav.addEventListener("mouseover",function(){
      this.canMove=false;
    });
    nav.addEventListener("mouseleave",function(){
      this.canMove=true;
    });
  }
}
</script>
<style scoped>
  .ring_imgs,.md_img>img{width:460px;}
  .ring_imgs{position:relative;}
  .md_img{width:460px;height:460px;}
  .img_item{
    position:relative;
    width:100%;height:100%;
    z-index:1;
  }
  .tr_bg{
    position:absolute;
    top:0;left:0;
    width:460px;height:460px;
    background-color:transparent;
    cursor:move;
    z-index:2;
  }
  .gray_bg{
    position:absolute;
    top:0;left:0;
    width:150px;height:150px;
    background:rgba(153, 153, 153,.4);
    z-index:1;
  }
  .md_img img{
    display:none;
    width:100%;height:100%;
    box-sizing:border-box;
    border:1px solid #f3f3f3;
  }
  .md_img img.active{display:block;}
  .white_bg{
    position:absolute;
    left:500px;top:0;
    width:300px;height:300px;
    background-color:#fff;
    border:1px solid rgb(204,204,204);
    overflow:hidden;
    z-index:999;
  }
  .lg_img{
    position:absolute;
    left:0;top:0;
    width:920px;height:920px;
  }
  .sm_img{margin:20px 0;position:relative;}
  .prev_btn,.next_btn{
    position:absolute;
    top:50%;margin-top:-9.5px;
    width:10px;height:19px;
    background:url(../../public/img/icon/pre_next.png) no-repeat;
  }
  .prev_btn{left:15px;background-position:0 0;cursor:pointer;}
  .next_btn{right:15px;background-position:-10px -20px;cursor:pointer;}
  .prev_btn.visible{background-position:0 -20px;}
  .next_btn.visible{background-position:-10px 0;}
  .sm_img_overflow{
    width:384px;
    overflow:hidden;
    margin:0 auto;
  }
  .sm_rings{transition:all .3s linear;}
  .sm_rings::after{
    content:"";
    display:block;
    clear:both;
  }
  .sm_rings li{
    float:left;
    width:60px;height:60px;
    margin-right:20px;
  }
  .sm_rings img{
    width:100%;
    box-sizing:border-box;
  }
  .sm_img_overflow img.active{
    border:1px solid #ffa6a6;
  }
  .ringbuy_share{
    text-align:center;
    line-height:26px;
    padding:10px;
  }
  .ringbuy_share>span{
    display:inline-block;
    font-size:12px;
    color:#7f7f7f;
    margin-right:3px;
  }
  .ringbuy_share>a{
    display:inline-block;
    width:26px;height:26px;
    background:url(../../public/img/icon/ico-shares.png);
    margin:0 2px;
    vertical-align:middle;
    outline: 0;border:0;font-size:0;
  }
  .ringbuy_share>a:nth-child(2){background-position:0 0;}
  .ringbuy_share>a:nth-child(3){background-position:-31px 0;}
  .ringbuy_share>a:nth-child(4){background-position:-62px 0;}
  .ringbuy_share>a:nth-child(5){background-position:-93px 0;}
  .ringbuy_share>a:nth-child(6){background-position:0 -34px;}
  .ringbuy_share>a:nth-child(7){background-position:-124px 0;}
  .ringbuy_share>a:hover{background-position-y:-68px;}
  .ringbuy_share>a:nth-child(6):hover{background-position:0 -102px;}
</style>
