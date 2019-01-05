<template>
  <!-- <div>
    学歴
  </div> -->
<form class="formrun" action="https://form.run/api/v1/r/tuybd48s9v7q665nv32fazcp" method="post">
  <!-- ↓You can add/change fields. -->
    <div class="form-wrapper">
      <h1>退職金</h1>
      <div class="question">
        Q1.お亡くなりになった方の死亡によって支給される退職金はありますか？
        <el-button type="text" @click="outerVisible = true">
          <question-icon></question-icon>
          【退職金に含むもの】
        </el-button>
      </div>

      <el-dialog title="【退職金に含むもの】" :visible.sync="outerVisible">
        ・現金以外の現物で支給される場合も含みます。
        <br>・金額が未確定の場合も含みます。
        <br>・退職金の受取人が確定している場合も含みます。
        <br>→確定している場合、「みなし相続財産」として遺産分割の対象とはなりませんが、相続財産となります。
      </el-dialog>

      <el-form label-width="150px">
        <el-form-item>
          <el-radio-group v-model="array[0]">
            <el-radio label="true" name="退職金" value="ある">ある</el-radio>
            <el-radio label="false" name="退職金" value="ない">ない</el-radio>
            <el-radio label="unknown" name="退職金" value="不明">不明</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>

      <section v-if="array[0] === 'true'">
        <el-form>
          <el-form-item　class="input-label" label="支給先をご入力ください">
            <el-input class="-half" name="退職金_支給先" type="text" row="1" placeholder="支給先"></el-input>
          </el-form-item>
        </el-form>
        <el-form>
          <el-form-item　class="input-label" label="金額をご入力ください">
            <el-input class="-half" name="退職金_金額" type="text" row="1" placeholder="金額"></el-input>
          </el-form-item>
        </el-form>
      </section>

      <div class="question">
        Q2.退職金とは別に弔慰金は支給されましたか？（通常、被相続人に死亡によって受ける弔慰金や花輪代、葬祭料などについては、相続税の対象になることはありません）
        <el-button type="text" @click="outerVisible = true">
          <question-icon></question-icon>
          【相続税の対象となる弔慰金】
        </el-button>
      </div>

      <el-dialog title="【相続税の対象となる弔慰金】" :visible.sync="outerVisible">
        下記の場合は相続税の対象となります。
        <br>①被相続人の雇用主などから弔慰金などの名目で受け取った金銭などのうち、実質上退職手当金等に該当すると認められる部分は相続税の対象になります。
        <br>②上記①以外の部分については、次に掲げる金額を弔慰金等に相当する金額とし、その金額を超える部分に相当する金額は退職手当金等として相続税の対象となります。
        <br>(1) 被相続人の死亡が業務上の死亡であるとき
        <br>被相続人の死亡当時の普通給与の3年分に相当する額
        <br>(2) 被相続人の死亡が業務上の死亡でないとき
        <br>被相続人の死亡当時の普通給与の半年分に相当する額
        <br>(注) 普通給与とは、俸給、給料、賃金、扶養手当、勤務地手当、特殊勤務地手当などの合計額をいいます。
      </el-dialog>

      <el-form label-width="150px">
        <el-form-item>
          <el-radio-group v-model="array[1]">
            <el-radio label="true" name="弔慰金" value="ある">ある</el-radio>
            <el-radio label="false" name="弔慰金" value="ない">ない</el-radio>
            <el-radio label="unknown" name="弔慰金" value="不明">不明</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>

      <section v-if="array[1] === 'true'">
        <el-form>
          <el-form-item　class="input-label" label="支給先をご入力ください">
            <el-input class="-half" name="弔慰金_支給先" type="text" row="1" placeholder="支給先"></el-input>
          </el-form-item>
        </el-form>
        <el-form>
          <el-form-item　class="input-label" label="金額をご入力ください">
            <el-input class="-half" name="弔慰金_金額" type="text" row="1" placeholder="金額"></el-input>
          </el-form-item>
        </el-form>
      </section>

    </div>
    <div class="button-block">
      <button class="submit" type="submit" @click="submit()" v-bind:disabled="isDisabled">
        <span class="text">保存する</span>
      </button>
    </div>
  </form>
</template>

<!-- import bootstrap -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
  export default {
    data() {
      return{
        id: '',
        familyName: '大下',
        firstName: '宏樹',
        enum: '完了',
        outerVisible: false,
        array: new Array(2),
      }
    },
    computed: {
      userName(){
        return this.familyName + ' ' + this.firstName + ' 様'
      },
      isDisabled(){
        for (var i = 0; i < this.array.length; i++){
          if (this.array[i] === undefined){ return true }
        }
        return false
      },
    },
    // async created(){
      // TODO::画面が表示されたときにIDと名前を取得するAPI
      // const response  = await axios.get('/api/formrun.json')
      // this.id = response.data.id
      // this.firstName = response.data.firstName
      // this.familyName = response.data.familyName
    // },
    method: {
      submit(){}
      // 送信ボタンが押されたときのAPI
      // async submit() {
        // const response = await axios.post('/api/formrun', {formrun: this.enum})
      // },
    },
  }
</script>

<style scoped>

</style>