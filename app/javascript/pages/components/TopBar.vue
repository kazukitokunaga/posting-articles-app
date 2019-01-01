<template>
  <header>
    <div class="header-wrapper">
      <!-- ドロップダウンメニューを表示する -->
      <el-dropdown class="dropdown-menu">
        <div class="site-logo">
          <img src="" class="logo">
          <img src="" class="arrow">
        </div>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>
            <router-link to="/">TOP</router-link>
          </el-dropdown-item>
          <el-dropdown-item>
            <a @click="signOut">ログアウト</a>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </header>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
export default {
  data() {
    return {
    }
  },
  computed: {
  },
  methods: {
    async signOut(){
      const response = await axios.delete('/users/sign_out')
      location.href= '/'
    }
  }
}
</script>

<style scoped>
header {
  align-items: center;
  background-color: #ffffff;
  border-bottom: inset 2px #00a6ea;
  justify-content: center;
  width: 100%;
}
.header-wrapper {
  height: 66px;
  width: 1000px;
  margin: 0 auto;
  display: flex;
}
.site-logo {
  width: 100%;
  cursor: pointer;
  color: #409EFF;
  text-align: right;
}
.site-logo .logo {
  width: 70px;
}
.site-logo .arrow {
  width: 12.6px;
  height: 6.3px;
  margin: 0 20px;
}
.dropdown-menu {
  justify-content: center;
  display: flex;
  text-align: center;
  height: 100%;
}
.dropdown-menu {
  border: 0;
  border-radius: 0;
  border-right: 1px solid #d8d8d8;
  height: 64px;
  top: 0;
}
.dropdown-menu :hover {
  background: #fafafa;
}

</style>
