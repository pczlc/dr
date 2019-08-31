<template>
  <div class="dr_bg">
    <div class="w-1360">
      <header-vue></header-vue>
      <!-- 顶部推荐图 -->
      <div>
        <a class="a_img" href="">
          <img src="../../public/img/range/15597275165cf78d9c51a1a.jpg" alt="">
        </a>
      </div>
      <div class="dr_bread clear_after">
        <ul class="clear_after">
          <li><router-link to="/">DR</router-link></li>
          <li><router-link to="/Products">求婚钻戒</router-link></li>
          <li><router-link to="/Products">所有商品</router-link></li>
        </ul>
        <div class="search">
          <div>
            <input type="text" placeholder="MY HEART系列">
            <i></i>
          </div>
          <a href=""></a>
        </div>
      </div>
      <!-- 商品列表 -->
      <div class="pro_bg">
        <ul class="clear_after">
          <li class="pro_li" v-for="(elem,i) of pros" :key="i">
            <router-link :to="`/Details?rid=${elem.rid}`" class="a_img">
              <img v-lazy="elem.img" alt="">
            </router-link>
            <p class="price">￥{{elem.price}}</p>
            <p class="title">{{elem.title}}</p>
            <a class="fav" href="javascript;;">收藏</a>
            <router-link :to="`/Details?rid=${elem.rid}`" class="buy">立即购买</router-link>
          </li>
        </ul>
        <!-- 页码 -->
        <div class="page">
          <span class="total">共{{len}}件 商品</span>
          <a class="prev_btn" href="javascript:;" @click="prev">&lt;</a>
          <span class="number">{{page}}/{{pcount}}</span>
          <a class="next_btn" href="javascript:;" @click="next">&gt;</a>
        </div>
      </div>
      <!-- 底部 -->
      <div id="footer"></div>
      <!-- 右侧悬浮框 -->
      <div id="dr_aside"></div>
      <footer-vue></footer-vue>
      <aside-vue></aside-vue>
    </div>
  </div>
</template>

<script>
import HeaderVue from '../components/Header.vue'
import FooterVue from '../components/Footer.vue'
import AsideVue from '../components/Aside.vue'
export default {
  data(){
    return {
      pros:{},
      pcount:0,
      len:0,
      page:1
    }
  },
  methods:{
    getProduct(){
      var page=this.$route.query.page;
      var pageSize=this.$route.query.pageSize;
      var reg=/^[1-9]\d*$/;
      if(!reg.test(page)){page=1};
      this.page=parseInt(page);
      if(!reg.test(pageSize)){pageSize=9};
      this.axios.get("product/list",{
        params:{page,pageSize}
      }).then(res=>{
        for(var item of res.data.pros){
          item.img=this.axios.defaults.baseURL+item.img;
        }
        this.pros=res.data.pros;
        this.pcount=res.data.count;
        this.len=res.data.len;
      })
    },
    next(){
      if(this.page<this.pcount){
        this.page++;
        this.$router.push(
          {path:"/Products",query:{page:this.page}}
        );
      }
    },
    prev(){
      if(this.page>1){
        this.page--;
        this.$router.push(
          {path:"/Products",query:{page:this.page}}
        );
      }
    }
  },
  created(){
    this.getProduct();
  },
  watch:{
    "$route"(){
      this.getProduct();
      this.page=this.$route.query.page;
    }
  },
  components:{
    HeaderVue,
    FooterVue,
    AsideVue
  }
}
</script>
<style scoped>
  .dr_bread{background:#fff;padding:20px 0;}
  .dr_bread>ul{margin-left:20px;display:flex;float:left;line-height:32px;}
  /* .dr_bread>ul>li{float:left;} */
  .dr_bread>ul>li+li:before{
    content:">";
    display:inline-block;
    color:#333;
    font-size:13px
  }
  .dr_bread>ul>li>a{
    font-size:13px;
    color:#333;
    padding:0 6px;
  }
  .dr_bread>ul>li>a:hover{color:#9b745c;}
  .dr_bread>.search{float:right;margin-right:20px;}
  .dr_bread>.search>div{border:1px solid #d7d7d7;}
  .dr_bread>.search input{
    border:0;
    font-size:14px;
    padding:7px 0 7px 13px;
    vertical-align:middle;
  }
  .dr_bread>.search i{
    display:inline-block;
    width:30px;height:30px;
    background:url(../../public/img/icon/search.png) no-repeat center;
    vertical-align:middle;
    margin-right:5px;
    cursor:pointer;
  }
  .pro_bg{background:#f4f2f3;padding-bottom:30px;}
  .pro_li{
    float:left;
    width:420px;height:490px;
    background:#fff;
    margin-left:25px;
    margin-top:25px;
    text-align:center;
  }
  .pro_li img{width:320px;height:320px;}
  .pro_li .price{
    font-size:18px;font-weight:700;
    color:#8b766c;
    margin-bottom:18px;
  }
  .pro_li .title{
    font-size:16px;
    line-height:26px;
    color:#333;
    margin-bottom:6px;
  }
  .pro_li .fav,.pro_li .buy{
    display:inline-block;
    width:115px;
    height:27px;
    font-size:12px;
    line-height:27px;
    border:1px solid #a98f83;
  }
  .pro_li .fav{background:#fff;border:1px solid #8b766c;color:#a98f83;}
  .pro_li .buy{background:#a98f83;border:1px solid #a98f83;color:#fff;}
  .pro_li .fav:hover{border:1px solid #8B766c;color:#8B766c;}
  .pro_li .buy:hover{background:#8b766c;border:1px solid #8b766c;}
  .page{
    text-align:center;
    font-size:14px;
    color:#999;
    line-height:19px;
    margin-top:30px;
  }
  .page a{color:#999;margin:0 15px;}
</style>
