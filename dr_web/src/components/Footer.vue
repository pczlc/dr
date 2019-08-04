<template>
  <div class="dr_footer">
    <!-- 上边距图片 -->
    <div class="dr_footer_top"></div>
    <!-- 服务列表 -->
    <ul class="dr_footer_icon d_flex">
      <li>
        <a href="javascript:;">
          <i></i>
          <p>专业认证</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>一钻双证</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>终生保养</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>以小换大</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>15天退换</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>全国免运费</p>
        </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
        <p>全程保险</p>
      </a>
      </li>
      <li>
        <a href="javascript:;">
            <i></i>
          <p>会员专享</p>
        </a>
      </li>
    </ul>
    <div class="dr_footer_bottom">
      <!-- 服务详情 -->
      <div class="dr_service">
        <ul class="d_flex">
          <li>
            <h6>关于我们</h6>
            <a href="javascript:;">专业认证</a>
            <a href="javascript:;">合作专区</a>
            <a href="javascript:;">公司简介</a>
          </li>
          <li>
            <h6>购物指南</h6>
            <a href="javascript:;">购买流程</a>
            <a href="javascript:;">支付方式</a>
            <a href="javascript:;">配送流程</a>
          </li>
          <li>
            <h6>售后服务</h6>
            <a href="javascript:;">退货流程</a>
            <a href="javascript:;">办理售后</a>
            <a href="javascript:;">15天退换</a>
          </li>
          <li>
            <h6>帮助中心</h6>
            <a href="javascript:;">注册流程</a>
            <a href="javascript:;">联系客服</a>
            <a href="javascript:;">网站地图</a>
          </li>
          <li>
            <h6>服务条款</h6>
            <a href="javascript:;">终生保养</a>
            <a href="javascript:;">注册协议</a>
            <a href="javascript:;">隐私声明</a>
          </li>
          <li>
            <h6>DR资讯</h6>
            <a href="javascript:;">资讯中心</a>
            <a href="javascript:;">品牌专题</a>
            <a href="javascript:;">DR标签</a>
          </li>
          <li>
            <h6>会员指引</h6>
            <a href="javascript:;">会员积分指引</a>
            <a href="javascript:;">会员手册</a>
            <a href="javascript:;">会员权益</a>
          </li>
        </ul>
        <!-- 关注 -->
        <div class="dr_focus">
          <h6>关注我们</h6>
          <p>一个让你相信真爱的地方，给你实用的情感指南，为你的爱情终身服务。</p>
          <a href="javascript:;"></a>
          <a href="javascript:;"><img src="" alt=""></a>
        </div>
      </div>
      <!-- 底部商标 -->
      <div class="dr_gray_b">
        <div class="clear_after">
          <div class="float_l">
            <a href="javascript:;">店员登录</a>
            <a href="javascript:;">隐私政策</a>
            <a href="javascript:;">网站地图</a>
            <a href="javascript:;">友情链接</a>
          </div>
          <div class="float_r">
            <a href="javascript:;">
              <img class="gov_icon" src="../../public/index/govIcon.gif" alt="">
            </a>
            <a href="javascript:;">
              <img src="../../public/index/icon_police.png" alt="">
            </a>
            <span>粤公网安备 44030302000934号/ 粤ICP备11012085号-2/Copyright©2006-2018 www.darryring.com 戴瑞珠宝 All Rights Reserved.</span>
            <img class="kx_icon" src="../../public/index/kxzd.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
  .dr_footer{padding-top:50px;background:#fff;}
  .dr_footer_top{
    height:16px;
    background:url(../../public/index/footer_rp.png) repeat-x;
  }
  .dr_footer_icon{
    width:1200px;
    padding:30px 80px;
  }
  .dr_footer_icon li{
    padding:0 32px;
  }
  .dr_footer_icon li a{
    display:block;
  }
  .dr_footer_icon li a i{
    display:inline-block;
    width:60px;height:60px;
    background:url(../../public/index/icon_footer.png) no-repeat;
  }
  .dr_footer_icon li:nth-child(2) a i{
    background-position:-60px 0;
  }
  .dr_footer_icon li:nth-child(3) a i{
    background-position:-120px 0;
  }
  .dr_footer_icon li:nth-child(4) a i{
    background-position:-180px 0;
  }
  .dr_footer_icon li:nth-child(5) a i{
    background-position:-240px 0;
  }
  .dr_footer_icon li:nth-child(6) a i{
    background-position:-300px 0;
  }
  .dr_footer_icon li:nth-child(7) a i{
    background-position:-360px 0;
  }
  .dr_footer_icon li:last-child a i{
    background-position:-420px 0;
  }
  .dr_footer_icon li a i:hover{
    background-position-y:-60px;
  }
  .dr_footer_icon li a p{
    color:#666;
    margin-top:16px;
  }
  .dr_footer_bottom{
    background:#f7f7f7;
    padding-top:56px;
  }
  .dr_service{
    width:1200px;
    margin:0 auto;
    padding-bottom:50px;
  }
  .dr_service ul li{
    width:170px;
    text-align:center;
    line-height:22px;
    padding:6px 0;
  }
  .dr_service ul li:not(:first-child){
    border-left:2px solid #dbdbdb;
  }
  .dr_service ul li h6{
    font-size:14px;
    font-weight:700;
    color:#666;
  }
  .dr_service ul li a{
    display:block;
    font-size:12px;
    color:#666;
  }
  .dr_focus{margin-top:28px;text-align:center;line-height:1;color:#666;}
  .dr_focus h6{font-size:14px;margin-bottom:12px;}
  .dr_focus p{font-size:12px;margin-bottom:18px;}
  .dr_focus a{
    display:inline-block;
    width:44px;height:44px;
    background:url(../../public/index/share_focus.png);
    margin:0 15px;
    vertical-align:middle;
  }
  .dr_focus a:last-child{background-position:-44px 0}
  .dr_focus a:hover{background-position-y:-53px;}
  .dr_gray_b{
    height:70px;
    background:#868686;
    font-size:12px;
    line-height:70px;
    padding:0 50px;
  }
  .dr_gray_b .float_l a{display:inline-block;color:#c2c2c2;margin-right:20px;}
  /* .dr_gray_b .float_r{margin-top:auto;margin-bottom:auto;} */
  .dr_gray_b .float_r a img{width:20px;vertical-align:middle;}
  .dr_gray_b .gov_icon{margin-top:7px;}
  .dr_gray_b span{font-size:12px;color:#ddd;}
  .kx_icon{width:68px;vertical-align:middle;margin-left:8px;}
</style>
