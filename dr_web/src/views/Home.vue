<template>
  <div class="dr_bg" :style="`background:${$store.state.indexBg}`">
    <div class="w-1360">
      <header-vue></header-vue>
      <router-view/>
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
  components:{
    HeaderVue,
    FooterVue,
    AsideVue
  }
}
</script>

<style>

</style>
