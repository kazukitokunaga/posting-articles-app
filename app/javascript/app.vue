<template>
  <div id="app">
    <top-bar></top-bar>
    <router-view></router-view>
  </div>
</template>

<script>
import axios from 'axios';

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default {
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
