<template>
  <div class="form-wrapper">
    <section>
      <h2>基本情報</h2>
      <el-form ref="form" :inline="true" :model="user" label-width="150px">
        <div class="name-box">
          <el-form-item label="姓">
            <el-input class="-narrow -space" placeholder="姓" v-model="user.familyName"></el-input>
          </el-form-item>
          <el-form-item label="名">
            <el-input class="-narrow" placeholder="名" v-model="user.firstName"></el-input>
          </el-form-item>
        </div>
        <div class="kana name-box">
          <el-form-item label="姓（カナ）" prop="familyNameKana">
            <el-input class="-narrow -space" placeholder="姓（カナ）" v-model="user.familyNameKana"></el-input>
          </el-form-item>
          <el-form-item label="名（カナ）" prop="firstNameKana">
            <el-input class="-narrow" placeholder="名（カナ）" v-model="user.firstNameKana"></el-input>
          </el-form-item>
        </div>
      </el-form>
      <el-form ref="form" :model="user" label-width="150px">
        <el-form-item label="性別">
          <el-radio-group v-model="user.gender">
            <el-radio label="male">男性</el-radio>
            <el-radio label="female">女性</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生年月日" prop="birthDate">
          <el-input class="-half" type="date" placeholder="生年月日" v-model="user.birthDate"></el-input>
        </el-form-item>
        <el-form-item label="電話番号" prop="phone">
          <el-input type="number" class="-narrow" placeholder="電話番号" v-model="user.phone"></el-input>
        </el-form-item>
        <el-form-item label="血液型" prop="bloodType">
          <el-input class="-narrow" placeholder="血液型" v-model="user.bloodType"></el-input>
        </el-form-item>
      </el-form>
    </section>

    <section>
      <el-form ref="form" :model="user.addressAttributes" label-width="150px">
        <h2>住所</h2>
        <el-form-item label="郵便番号">
          <el-input type="number" class="-narrow" placeholder="郵便番号" v-model="user.addressAttributes.postalCode"></el-input>
        </el-form-item>
        <el-form-item label="住所">
          <el-input class="-wide" placeholder="住所" v-model="user.addressAttributes.address"></el-input>
        </el-form-item>
        <el-form-item label="住所(カナ)">
          <el-input class="-wide" placeholder="住所(カナ)" v-model="user.addressAttributes.addressKana"></el-input>
        </el-form-item>
        <el-form-item label="マンション名">
          <el-input class="-wide" placeholder="マンション名" v-model="user.addressAttributes.building"></el-input>
        </el-form-item>
      </el-form>
      <el-form class="domicile-form" ref="form" :model="user.domicileAttributes" label-width="150px">
        <h2>本籍</h2>
        <el-form-item label="郵便番号">
          <el-input type="number" class="-narrow" placeholder="郵便番号" v-model="user.domicileAttributes.postalCode"></el-input>
        </el-form-item>
        <el-form-item label="住所">
          <el-input class="-wide" placeholder="住所" v-model="user.domicileAttributes.address"></el-input>
        </el-form-item>
        <el-form-item label="住所(カナ)">
          <el-input class="-wide" placeholder="住所(カナ)" v-model="user.domicileAttributes.addressKana"></el-input>
        </el-form-item>
        <el-form-item label="マンション名">
          <el-input class="-wide" placeholder="マンション名" v-model="user.domicileAttributes.building"></el-input>
        </el-form-item>
      </el-form>
    </section>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        user:{
          familyName:     '',
          familyNameKana: '',
          firstName:      '',
          firstNameKana:  '',
          birthDate:      '',
          gender:         '',
          phone:          '',
          bloodType:      '',
          addressAttributes: {
            postalCode:  '',
            addressKana: '',
            address:     '',
            building:    '',
          },
          domicileAttributes: {
            postalCode:  '',
            addressKana: '',
            address:     '',
            building:    '',
          },
        },
      }
    },
  }
</script>

<style scoped>
.el-input {
  width: 40%;
}
</style>