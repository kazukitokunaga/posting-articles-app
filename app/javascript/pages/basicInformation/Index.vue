<template>
  <div>
    <ul>
      <li><router-link to="/basicinformation/userprofile">ユーザー情報</router-link></li>
    </ul>
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
  }
</script>

<style scoped>
ul {
  list-style: none;
}
ul > li {
  display: inline-block;
}
</style>