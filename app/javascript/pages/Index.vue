<template>
  <!-- 要素1つの制限のため仮に設置 -->
  <div class="dashboard-wrapper">
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu>
          <el-menu-item>
            <i class="el-icon-message"></i>
            <router-link to="basicinformation/profile">基本情報</router-link>
          </el-menu-item>
          <el-menu-item>
            <i class="el-icon-menu"></i>
            <router-link to="setting">設定</router-link>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header>

        </el-header>

        <el-main>

        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
</script>

<style scoped>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  .el-aside {
    color: #333;
  }
</style>