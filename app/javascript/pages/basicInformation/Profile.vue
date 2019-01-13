<template>
  <div class="form-wrapper">
    <section>
      <h2>基本情報</h2>
      <el-form ref="form" :inline="true" :model="profile" label-width="150px">
        <div class="name-box">
          <el-form-item label="姓">
            <el-input class="-narrow -space" placeholder="姓" v-model="profile.familyName"></el-input>
          </el-form-item>
          <el-form-item label="名">
            <el-input class="-narrow" placeholder="名" v-model="profile.firstName"></el-input>
          </el-form-item>
        </div>
        <div class="kana name-box">
          <el-form-item label="姓（カナ）">
            <el-input class="-narrow -space" placeholder="姓（カナ）" v-model="profile.familyNameKana"></el-input>
          </el-form-item>
          <el-form-item label="名（カナ）">
            <el-input class="-narrow" placeholder="名（カナ）" v-model="profile.firstNameKana"></el-input>
          </el-form-item>
        </div>
      </el-form>
      <el-form ref="form" :model="profile" label-width="150px">
        <el-form-item label="性別">
          <el-radio-group v-model="profile.gender">
            <el-radio label="male">男性</el-radio>
            <el-radio label="female">女性</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生年月日">
          <el-input class="-half" type="date" placeholder="生年月日" v-model="profile.birthDate"></el-input>
        </el-form-item>
        <el-form-item label="電話番号">
          <el-input type="number" class="-narrow" placeholder="電話番号" v-model="profile.phone"></el-input>
        </el-form-item>
        <el-form-item label="血液型">
          <el-input class="-narrow" placeholder="血液型" v-model="profile.bloodType"></el-input>
        </el-form-item>
      </el-form>
    </section>

    <section>
      <el-form ref="form" :model="profile.addressesAttributes" label-width="120px">
        <h2>住所</h2>
        <template v-for="address in profile.addressesAttributes">
          <el-form-item label="郵便番号" :key="address.id">
            <el-input type="number" class="-narrow" placeholder="郵便番号" v-model="address.postalCode"></el-input>
          </el-form-item>
          <el-form-item label="住所" :key="address.id">
            <el-input class="-wide" placeholder="住所" v-model="address.address"></el-input>
          </el-form-item>
          <el-form-item label="住所(カナ)" :key="address.id">
            <el-input class="-wide" placeholder="住所(カナ)" v-model="address.addressKana"></el-input>
          </el-form-item>
          <el-form-item label="マンション名" :key="address.id">
            <el-input class="-wide" placeholder="マンション名" v-model="address.building"></el-input>
          </el-form-item>
        </template>
      </el-form>
      <h2>本籍</h2>
      <el-form ref="form" :model="profile.domicilesAttributes" label-width="120px">
        <template v-for="domicile in profile.domicilesAttributes">
          <el-form-item label="郵便番号" :key="domicile.id">
            <el-input type="number" class="-narrow" placeholder="郵便番号" v-model="domicile.postalCode"></el-input>
          </el-form-item>
          <el-form-item label="住所" :key="domicile.id">
            <el-input class="-wide" placeholder="住所" v-model="domicile.address"></el-input>
          </el-form-item>
          <el-form-item label="住所(カナ)" :key="domicile.id">
            <el-input class="-wide" placeholder="住所(カナ)" v-model="domicile.addressKana"></el-input>
          </el-form-item>
          <el-form-item label="マンション名" :key="domicile.id">
            <el-input class="-wide" placeholder="マンション名" v-model="domicile.building"></el-input>
          </el-form-item>
        </template>
      </el-form>
    </section>
    <el-button type="primary" @click="postForm">保存</el-button>
  </div>
</template>
<script>
  import axios from 'plugins/axios'
  import Vue from 'vue'
  export default {
    data(){
      return{
        profile:{
          familyName:     '',
          familyNameKana: '',
          firstName:      '',
          firstNameKana:  '',
          birthDate:      '',
          gender:         '',
          phone:          '',
          bloodType:      '',
          addressesAttributes: [
            {
              postalCode:  '',
              addressKana: '',
              address:     '',
              building:    '',
            }
          ],
          domicilesAttributes: [
            {
              postalCode:  '',
              addressKana: '',
              address:     '',
              building:    '',
            }
          ],
        },
        alert: {
          status:   '',
          messages: [],
        },
      }
    },
    methods:{
      postForm() {
        this.profile.id ? this.postToUpdateAPI() : this.postToCreateAPI()
      },
      async postToCreateAPI() {
        const response = await axios.post('/api/profiles', {profile: this.profile})
        this.createAlert(response)
        if (!response.data.messages) this.profile = response.data
      },
      async postToUpdateAPI() {
        const id       = this.profile.id
        const response = await axios.patch(`/api/profiles/${id}`, {profile: this.profile})
        this.createAlert(response)
        if (!response.data.messages) this.profile = response.data
      },
      createAlert(response) {
        this.alert.messages = []
        this.alert.status   = ''
        if (response.data.messages) {
          this.alert.messages = response.data.messages
          this.alert.status   = 'error'
        } else {
          this.alert.messages.push('保存に成功しました')
          this.alert.status = 'success'
        }
      },
    },
    async created () {
      const response = await axios.get('/api/profiles')
      this.profile = response.data
    },
  }
</script>

<style scoped>
.el-input {
  width: 40%;
}
</style>