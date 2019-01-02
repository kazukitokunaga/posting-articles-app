<template>
  <div>
    <el-menu :default-active="activeIndex" mode="horizontal" @select="handleSelect">
      <el-menu-item index="1"><router-link to="/basicinformation/userprofile">基本情報</router-link></el-menu-item>
      <el-menu-item index="2"><router-link to="/basicinformation/educationalbackground">学歴</router-link></el-menu-item>
      <el-menu-item index="3"><router-link to="/basicinformation/employmenthistory">職歴</router-link></el-menu-item>
      <el-menu-item index="4"><router-link to="/basicinformation/qualification">資格</router-link></el-menu-item>
      <el-menu-item index="5"><router-link to="/basicinformation/pastaddress">過去の住所</router-link></el-menu-item>
      <el-menu-item index="6"><router-link to="/basicinformation/thingstotell">伝えたいこと</router-link></el-menu-item>
      <el-menu-item index="7"><router-link to="/basicinformation/care">介護</router-link></el-menu-item>
    </el-menu>
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
    data(){
      return{
        activeIndex: '',
      }
    },
    methods:{
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
    }
  }
</script>

<style scoped>

</style>