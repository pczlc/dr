<template>
  <div class="w-1360">
    <header-vue></header-vue>
    <div class="bg_white">
      <ul class="dr_bread">
        <li><router-link to="/">DR</router-link></li>
        <li><router-link to="/Products">求婚钻戒</router-link></li>
        <li><router-link to="/Products">MY HEART系列</router-link></li>
      </ul>
      <div class="w-1000">
        <div class="ringbuy_cort clear_after">
          <!-- 放大镜效果组件 -->
          <magnifier-vue
            :imgs="imgs"
            :status="status"
            :showMd="showMd"
          ></magnifier-vue>
          <div class="ring_msg float_r">
            <h2 class="title">{{title}}</h2>
            <div class="price">
              <span>¥{{price}}</span>
              <router-link to="/Products">更多MY HEART系列&gt;&gt;</router-link>
            </div>
            <ul class="ringbuy_sale">
              <li>近期售出：<span>2</span></li>
              <li>评价：<span>297</span></li>
              <li>成都</li>
            </ul>
            <ul class="ringbuy_params clear_after">
              <li>主钻重量: 18分</li>
              <li>钻石颜色: H色</li>
              <li>钻石净度: SI1</li>
              <li>钻石切工: VG</li>
            </ul>
            <div class="ringbuy_choose">
              <div class="choose_first">
                <span>戒托材质</span>
                <div @click="active">
                  <a href="javascript:;" class="choose_btn active">PT950</a>
                  <a href="javascript:;" class="choose_btn">白18K金</a>
                  <span class="ringbuy_msg">本商品价格为单只戒指售价，材质调整后金额会自动调整。</span>
                </div>
              </div>
              <div class="choose_second">
                <span>搭配主钻</span>
                <div @click="active">
                  <a href="javascript:;" class="choose_btn active">50分H色</a>
                  <a href="javascript:;" class="choose_btn">55分D色</a>
                  <a href="javascript:;" class="choose_btn">55分H色</a>
                  <a href="javascript:;" class="choose_btn">70分D色</a>
                  <a href="javascript:;" class="choose_btn">70分H色</a>
                  <a href="javascript:;" class="choose_btn">75分D色</a>
                  <a href="javascript:;" class="choose_btn">100分E色</a>
                  <a href="javascript:;" class="choose_btn">100分F色</a>
                  <a href="javascript:;" class="help">如何选择钻石?</a>
                </div>
              </div>
              <div class="choose_thrid">
                <span>选择手寸</span>
                <select class="ringbuy_size">
                  <option value="">选择手寸</option>
                  <option v-for="(elem,i) of 28" :key="i" value="">{{elem+5}}</option>
                </select>
                <a href="" class="help">如何测量?</a>
              </div>
              <div class="choose_fourth">
                <span>免费刻字</span>
                <div>
                  <div>
                    <span>是否需要艺术字</span>
                    <label><input type="radio" name="lettering"> 否</label>
                    <label><input type="radio" name="lettering"> 是</label>
                  </div>
                  <div>
                    <input type="text" placeholder="限输入5个汉字或10个字母">
                    <i>♥</i>
                    <i>&</i>
                    <a href="javascript:;">预览效果</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="ringbuy_btn">
              <a href="javascript:;" class="addCart" @click="addCart">
                <span>加入购物车</span>
              </a>
              <a href="javascript:;" class="buyNow">立即购买</a>
            </div>
            <p class="ringbuy_Delivery">
              配送说明：<strong> 预计20个工作日送达（限大陆地区）,如需加急或者其他地区请咨询客服。</strong>
            </p>
            <div class="ringbuy_Promise">
              <strong>服务承诺</strong>
              <span>15天退换</span>
              <span>全国包邮</span>
              <span>终生保养</span>
              <a href=""><i>在线客服</i></a>
            </div>
          </div>
        </div>
        <div class="ringbuy_details">
          <ul>
            <li class="active"><a href="javascript:;">商品详情</a></li>
            <li><a href="javascript:;">累计评论(92)</a></li>
            <li><a href="javascript:;">售后保障</a></li>
            <li><a href="javascript:;">如何购买</a></li>
          </ul>
          <ul>
            <li>商品分类：<span>求婚钻戒</span></li>
            <li>产品编号：<span>A03003</span></li>
            <li>净度：<span>SI1</span></li>
            <li>戒托材质：<span>白18K金</span></li>
            <li>系列名称：<span>MY HEART系列</span></li>
            <li>颜色：<span>H</span></li>
            <li>副石材质：<span>钻石</span></li>
            <li>主石大小：<span>50分</span></li>
            <li>副石数量：<span>67-98</span></li>
            <li>主石材质：<span>钻石</span></li>
            <li>副石总重：<span>71-119分</span></li>
            <li>主石数量：<span>1</span></li>
            <li>手寸：<span>客订</span></li>
            <li>主石总重：<span>50分</span></li>
            <li>形状：<span>心形</span></li>
          </ul>
          <div class="ringbuy_img">
            <a href="javascript:;">
              <img src="../../public/img/details/1501499527.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499535.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499543.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499548.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499552.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499557.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1501499562.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/img/details/1543992030.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </div>
    <footer-vue></footer-vue>
    <aside-vue></aside-vue>
    <!-- 购物车弹窗 -->
    <div class="add_success" v-show="addSuccess">
      <div>
        <div class="black_border">
          <a href="javascript:;" class="close" @click="closeScs"></a>
          <img class="logo" src="../../public/img/details/dr_logo.png">
          <span class="success_font">商品已成功加入购物车</span>
          <router-link to="/Cart" class="toCart">去购物车结算</router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import HeaderVue from '../components/Header.vue'
import FooterVue from '../components/Footer.vue'
import AsideVue from '../components/Aside.vue'
import MagnifierVue from '../components/Magnifier.vue'
export default {
  data(){
    return {
      rid:"",
      title:"",
      price:"",
      imgs:[],
      status:[],
      addSuccess:false
    }
  },
  methods:{
    loadImg(){
      this.rid=this.$route.query.rid;
      this.axios.get(`product/details?rid=${this.rid}`).then(res=>{
        this.title=res.data.msg.title;
        this.price=res.data.msg.price;
        //保存图片数据，并创建一个数组保存图片active属性
        for(var img of res.data.imgs){
          this.imgs.push(this.axios.defaults.baseURL+img);
          this.status.push("");
        };
        //初始化第一张图为active
        this.status[0]="active";
      })
    },
    showMd(i){
      //鼠标移动到i时，让当前的class为active，并去除其他class
      for(var j=0;j<this.status.length;j++){
        this.status.splice(j,1,"");
      }
      this.status[i]="active";
    },
    //事件委托，给a标签的父元素绑事件
    active(e){
      //将触发事件的元素保存
      var a=e.target;
      if(a.tagName=="A"){
        //找到兄弟元素，并移除active
        var parent=a.parentNode.children;
        for(var elem of parent){
          elem.classList.remove("active");
        }
        a.classList.add("active");
      }
    },
    addCart(){
      // 判断是否登录
      this.axios.get("user/getSession").then(res=>{
        // 未登录跳转至登录页
        if(res.data.code==-1){
          this.$router.push("/Login");
        }else{
          // 已登录则加入购物车列表
          var ringObj=this.qs.stringify({
            user_id:res.data.data.uid,
            ring_id:this.rid,
            ring_title:this.title,
            ring_img:this.imgs[0].split(this.axios.defaults.baseURL)[1],
            ring_price:this.price,
          });
          this.axios.post("cart/addItem",ringObj).then(res=>{
            if(res.data.code==1){
              this.addSuccess=true;
            }else{
              alert("购物车已有该商品!")
            }
          })
        }
      })      
    },
    closeScs(){
      this.addSuccess=false;
    }
  },
  created(){
    this.loadImg();
    this.$store.commit("changeBg","#fff");
  },
  beforeDestroy(){
    this.$store.commit("changeBg","url(img/index/back_r_o.jpg)");
  },
  components:{
    HeaderVue,
    FooterVue,
    AsideVue,
    MagnifierVue
  }
}
</script>

<style scoped>
  .bg_white{background:#fff;border-top:1px solid #666;}
  .dr_bread{
    height:70px;
    line-height:70px;
    display:flex;
    padding-left:40px;
  }
  .dr_bread>li>a{font-size:12px;color:#333;}
  .dr_bread>li+li:before{content:">";margin:0 5px;}
  .dr_bread>li>a:hover{color:#8b766c;}
  .w-1000{width:1000px;margin:0 auto;text-align:center;}
  .ringbuy_cort{padding-bottom:60px;}
  .ring_msg{width:520px;text-align:left;}
  .ring_msg>.title{font-size:24px;font-weight:400;}
  .ring_msg>.price{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin:14px 0;
  }
  .price>span:first-child{color:#8b766c;font-size:24px;}
  .price>a:last-child{color:#999;font-size:12px;}
  .price>a:last-child:hover{color:#c57d5c;}
  .ringbuy_sale{
    display:flex;
    background:#f8f8f8;
    border-top:1px dashed #ddd;
    border-bottom:1px dashed #ddd;
    padding:10px 0;
  }
  .ringbuy_sale>li{
    width:33.3%;
    text-align:center;
    color:#999;
    font-size:12px;
  }
  .ringbuy_sale>li+li{border-left:1px dashed #ddd;}
  .ringbuy_sale>li>span{color:#ffacac;}
  .ringbuy_params{margin-top:18px;font-size:14px;}
  .ringbuy_params>li{
    width:50%;
    float:left;
    color:#999;
    box-sizing: border-box;
    padding-left:8px;
    padding-bottom:8px;
  }
  .ringbuy_choose{
    background:#f8f8f8;
    margin-top:10px;
    font-size:12px;
    padding:20px;
  }
  .ringbuy_choose>div{display:flex;align-items:center;margin-bottom:14PX;}
  .ringbuy_choose>div>span{
    width:50px;
    color:#838383;
    vertical-align:middle;
    margin-right:16px;
  }
  .ringbuy_choose>div>div{
    width:400px;
    display:flex;
    align-items:center;
    flex-wrap:wrap;
    }
  .choose_btn{
    display:inline-block;
    width:100px;height:30px;
    box-sizing:border-box;
    border:1px solid #afafb0;
    background:#fff;
    color:#666;
    line-height:28px;
    text-align:center;
    margin-right:5px;
  }
  .choose_btn:hover{
    border:2px solid #907c73;
    line-height:26px;
  }
  .choose_btn.active{
    border:2px solid #907c73;
    background:url(../../public/img/details/right.png) no-repeat bottom right;
    line-height:26px;
  }
  .ringbuy_msg{
    display:inline-block;
    width:158px;
    color:#afafb0;
  }
  .choose_second .choose_btn{margin-bottom:5px;}
  .choose_second,.choose_fourth{align-items:flex-start !important;}
  .choose_second>span,.choose_fourth>span{line-height:30px;}
  .help{color:#afafb0;padding-left:2px;}
  .help:hover{color:#bf967c;}
  .ringbuy_size{height:30px;box-sizing:border-box;margin-right:10px;}
  .choose_fourth>div{line-height:30px;color:#838383;}
  .choose_fourth>div label input{margin-left:24px;vertical-align:middle;}
  .choose_fourth>div{flex-direction:column;align-items:flex-start !important;}
  .choose_fourth input{height:30px;box-sizing:border-box;vertical-align:middle;}
  .choose_fourth i,.choose_fourth a{
    display:inline-block;
    width:30px;height:30px;
    box-sizing:border-box;
    border:1px solid #afafb0;
    color:#afafb0;
    font-size:16px;
    text-align:center;
    line-height:28px;
    vertical-align:middle;
    margin-left:10px;
    cursor:pointer;
  }
  .choose_fourth a{
    width:initial;
    border:1px solid #907c73;
    color:#907c73;
    font-size:12px;
    padding:0 5px;
  }
  .choose_fourth a:hover{background:#907c73;color:#fff;}
  .ringbuy_btn{margin:30px 0;text-align:center;}
  .ringbuy_btn>a{
    display:inline-block;
    width:180px;height:40px;
    border:1px solid #8b766c;
    line-height:38px;
  }
  .addCart{
    background:#a98f83;
    color:#fff;
    margin-right:10px;
  }
  .addCart>span{
    padding-left:26px;
    background:url(../../public/img/details/shopcart.png) no-repeat left center;
  }
  .addCart:hover,.buyNow:hover{
    color:#fff;
    background:#8b766c;
    border:1px solid #8b766c;
  }
  .buyNow{color:#8b766c}
  .ringbuy_Delivery{
    font-size:12px;
    color:#838383;
    padding-bottom:10px;
    padding-left:20px;
    border-bottom:1px dashed #ddd;
  }
  .ringbuy_Promise{
    font-size:12px;
    color:#838383;
    padding:14px 0 14px 20px;;
    border-bottom:1px dashed #ddd;
  }
  .ringbuy_Promise>strong{margin-right:12px;}
  .ringbuy_Promise>span{
    display: inline-block;
    line-height:24px;
    padding-left:28px;
    margin-right:14px;
  }
  .ringbuy_Promise>span:nth-child(2){
    background:url(../../public/img/details/sev_first.png) no-repeat left center;
  }
  .ringbuy_Promise>span:nth-child(3){
    background:url(../../public/img/details/sev_sec.png) no-repeat left center;
  }
  .ringbuy_Promise>span:nth-child(4){
    background:url(../../public/img/details/sev_third.png) no-repeat left center;
  }
  .ringbuy_Promise>a{
    display: inline-block;
    background:#d1c1b4;
    border-radius:3px;
    color:#fff;
    margin-left:60px;
    padding:6px;
  }
  .ringbuy_Promise>a>i{
    line-height:16px;
    background:url(../../public/img/details/thekf.gif) no-repeat left center;
    padding-left:24px;
  }
  .ringbuy_Promise>a:hover{background:#8b766c;}
  .ringbuy_details>ul:first-child{
    display:flex;
    justify-content:center;
    border-bottom:2px solid #eaeceb;
    margin-bottom:40px;
  }
  .ringbuy_details>ul:first-child>li{
    width:165px;
    padding-bottom:10px;
    font-size:13px;
    font-weight:bold;
  }
  .ringbuy_details>ul:first-child>li>a{
    display:inline-block;
    width:100%;
    color:#999;
  }
  .ringbuy_details>ul:first-child>li+li a{
    border-left:2px solid #eaeceb;
  }
  .ringbuy_details>ul:first-child>.active{
    border-bottom:2px solid #000;
    margin-bottom:-2px;
  }
  .ringbuy_details>ul:first-child>.active>a{color:#000;}
  .ringbuy_details>ul:nth-child(2){
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    font-size:12px;
    margin-left:140px;
    margin-bottom:20px;
  }
  .ringbuy_details>ul:nth-child(2)>li{
    width:30%;
    text-align:left;
    color:#666;
    line-height:26px;
    margin-bottom:8px;
  }
  .ringbuy_details>ul:nth-child(2)>li>span{color:#999;}
  .ringbuy_img>a{display:block;}
  .ringbuy_img>a>img{width:100%;}
  .add_success{
    position:fixed;
    top:0;left:0;
    width:100%;height:100%;
    background:rgba(0,0,0,.5);
    z-index:999;
  }
  .add_success>div{
    width:490px;
    position:absolute;
    top:20%;left:50%;
    background:#fff;
    margin-left:-245px;
    padding:15px;
  }
  .black_border{
    display:flex;
    flex-direction:column;
    align-items:center;
    position:relative;
    border:2px solid #5e5d62;
    padding:60px 0 100px;
  }
  .black_border .close{
    position:absolute;
    top:16px;right:16px;
    width:14px;height:14px;
    background:url(../../public/img/details/close1.png) no-repeat center;
    padding:10px;
  }
  .success_font{
    height:34px;
    line-height:34px;
    font-family:SimSun;
    font-size:24px;
    font-weight:700;
    color:#8b766c;
    padding-left:44px;
    background:url(../../public/img/details/dagou.png) no-repeat left center;
    margin:40px 0 10px;
  }
  .toCart{
    width:138px;height:28px;
    line-height:28px;
    border:1px solid #8b766c;
    font-size:14px;
    color:#8b766c;
    text-align:center;
    margin-top:50px;
  }
  .toCart:hover{background:#8b766c;color:#fff;}
</style>
