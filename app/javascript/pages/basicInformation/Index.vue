<template>
  <div>
    <ul>
      <li><router-link to="/basicinformation/userprofile">基本情報</router-link></li>
      <li><router-link to="/basicinformation/educationalbackground">学歴</router-link></li>
      <li><router-link to="/basicinformation/employmenthistory">職歴</router-link></li>
      <li><router-link to="/basicinformation/qualification">資格</router-link></li>
      <li><router-link to="/basicinformation/pastaddress">過去の住所</router-link></li>
      <li><router-link to="/basicinformation/thingstotell">伝えたいこと</router-link></li>
      <li><router-link to="/basicinformation/care">介護</router-link></li>
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