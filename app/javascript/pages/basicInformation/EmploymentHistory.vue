<template>
  <!-- <div>
    職歴
  </div> -->
<form class="formrun" action="https://form.run/api/v1/r/tuybd48s9v7q665nv32fazcp" method="post">
  <!-- ↓You can add/change fields. -->
      <h1>退職金</h1>
        Q1.お亡くなりになった方の死亡によって支給される退職金はありますか？
          【退職金に含むもの】
            <input type="radio" label="true" name="退職金" value="ある">ある
            <input class="-half" name="退職金_支給先" type="text" row="1" placeholder="支給先">
            <input class="-half" name="退職金_金額" type="text" row="1" placeholder="金額">

        Q2.退職金とは別に弔慰金は支給されましたか？（通常、被相続人に死亡によって受ける弔慰金や花輪代、葬祭料などについては、相続税の対象になることはありません）
          【相続税の対象となる弔慰金】
            <input type="radio" name="弔慰金" value="ある">ある
            <input class="-half" name="弔慰金_支給先" type="text" row="1" placeholder="支給先">
            <input class="-half" name="弔慰金_金額" type="text" row="1" placeholder="金額">

    <div class="button-block">
      <button class="submit" type="submit" @click="submit()">
        <span class="text">保存する</span>
      </button>
    </div>
    <button class="submit" type="submit" @click="submit()">送信２</button>
    <button type="submit">送信３</button>
    <button type="submit" data-formrun-error-text="未入力の項目があります" data-formrun-submitting-text="送信中...">送信４</button>
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