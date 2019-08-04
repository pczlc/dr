<template>
  <div class="w-1360">
    <header-vue></header-vue>
    <div class="bg_white">
      <ul class="dr_bread">
        <li><a href="javascript:;">DR</a></li>
        <li><a href="javascript:;">求婚钻戒</a></li>
        <li><a href="javascript:;">MY HEART系列</a></li>
      </ul>
      <div class="w-1000">
        <div class="ringbuy_cort clear_after">
          <div class="ring_imgs float_l">
            <div class="md_img">
              <img src="../../public/products/BELIEVE系列 典雅 50分 G色/1.jpg" alt="">
              <div class="gray_bg"></div>
            </div>
            <div class="sm_img">
              <span class="prev_btn visible"></span>
              <span class="next_btn visible"></span>
              <div class="sm_img_overflow">
                <ul>
                  <li v-for="(img,i) of imgs" :key="i">
                    <img class="active" :src="`http://127.0.0.1:5050/${img.md}`" alt="">
                  </li>
                </ul>
              </div>
            </div>
            <div class="lg_img"></div>
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
                <div>
                  <a href="javascript:;" class="choose_btn active">PT950</a>
                  <a href="javascript:;" class="choose_btn">白18K金</a>
                  <span class="ringbuy_msg">本商品价格为单只戒指售价，材质调整后金额会自动调整。</span>
                </div>
              </div>
              <div class="choose_second">
                <span>搭配主钻</span>
                <div>
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
                    <a href="">预览效果</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="ringbuy_btn">
              <a href="" class="addCart">
                <span>加入购物车</span>
              </a>
              <a href="" class="buyNow">立即购买</a>
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
              <img src="../../public/details/1501499527.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499535.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499543.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499548.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499552.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499557.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1501499562.jpg" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/details/1543992030.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </div>
    <footer-vue></footer-vue>
    <aside-vue></aside-vue>
  </div>
</template>
<script>
import HeaderVue from '../components/Header.vue'
import FooterVue from '../components/Footer.vue'
import AsideVue from '../components/Aside.vue'
export default {
  data(){
    return {
      title:"",
      price:"",
      imgs:[]
    }
  },
  created(){
    var rid=this.$route.query.rid;
    this.axios.get(`product/details?rid=${rid}`).then(res=>{
      this.title=res.data.msg.title;
      this.price=res.data.msg.price;
      this.imgs=res.data.imgs;
    })
  },
  components:{
    HeaderVue,
    FooterVue,
    AsideVue
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
  .ring_imgs,.md_img>img{width:460px;}
  .ring_imgs{position:relative;}
  .md_img{position:relative;}
  .md_img>.gray_bg{
    position:absolute;
    top:0;left:0;
    width:150px;height:150px;
    background:rgba(153, 153, 153,.4);
    cursor:move;
  }
  .md_img>img{box-sizing:border-box;border:1px solid #f3f3f3;}
  .sm_img{margin:20px 0;position:relative;}
  .prev_btn,.next_btn{
    position:absolute;
    top:50%;margin-top:-9.5px;
    width:10px;height:19px;
    background:url(../../public/icon/pre_next.png) no-repeat;
  }
  .prev_btn{left:15px;background-position:0 0;}
  .next_btn{right:15px;background-position:-10px -20px;}
  .prev_btn.visible{background-position:0 -20px;}
  .next_btn.visible{background-position:-10px 0;}
  .sm_img_overflow{
    width:384px;
    overflow:hidden;
    margin:0 auto;
  }
  .sm_img_overflow ul{display:flex;}
  .sm_img_overflow li{
    width:60px;height:60px;
    margin-right:20px;
  }
  .sm_img_overflow img{
    width:100%;
    box-sizing:border-box;
  }
  .sm_img_overflow img.active{
    border:1px solid #ffa6a6;
  }
  .lg_img{
    position:absolute;
    display:none;
    right:-200px;top:0;
    width:200px;height:200px;
    background:url("../../public/products/BELIEVE系列 典雅 50分 G色/1.jpg") no-repeat;
    background-size:200%;  
    border:1px solid rgb(204,204,204);
    z-index:999;
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
    background:url(../../public/icon/ico-shares.png);
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
    background:url(../../public/details//right.png) no-repeat bottom right;
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
    background:url(../../public/details/shopcart.png) no-repeat left center;
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
    background:url(../../public/details/sev_first.png) no-repeat left center;
  }
  .ringbuy_Promise>span:nth-child(3){
    background:url(../../public/details/sev_sec.png) no-repeat left center;
  }
  .ringbuy_Promise>span:nth-child(4){
    background:url(../../public/details/sev_third.png) no-repeat left center;
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
    background:url(../../public/details/thekf.gif) no-repeat left center;
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
</style>
