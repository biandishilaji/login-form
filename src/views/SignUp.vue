<template>
  <div class="login background">
    <div class="container" ref="container">
      <div class="form-container sign-in-container">
        <form action="#">
          <!--			<h1></h1>-->
          <form class="form" style="">
            <input v-model="signUp.email" :style="signUp.email ? 'width: 212px' : ''" type="email" class="form__field"/>
            <button v-if="!signUp.email"
                    type="button"
                    class="btn btn--primary btn--inside "
                    title="Meu e-mail principal"
            >
              E-mail
            </button>
            <input v-model="signUp.name" :style="signUp.name ? 'width: 212px' : ''" type="email" class="form__field"/>
            <button v-if="!signUp.name"
                    type="button"
                    class="btn btn--primary btn--inside "
                    title="Meu nome completo"
            >
              Nome
            </button>
            <input v-model="signUp.password" :style="signUp.password ? 'width: 212px' : ''"
                   type="email"
                   class="form__field"
                   title="Minha senha secreta"
            />
            <button v-if="!signUp.password"
                    type="button"
                    class="btn btn--primary btn--inside "
            >
              Senha
            </button>
            <button ref="button_submit-0" v-on:click.prevent="updateButtonMsg(0)" style="color: white"
                    class="submit-button-1 state-0 submit-button-color"><span class="pre-state-msg">Cadastrar</span><span
                class="current-state-msg hide">Enviando...</span><span class="done-state-msg hide">Finalizado!</span>
            </button>
          </form>
        </form>
      </div>
      <div class="form-container sign-up-container">
        <form class="form" style="">
          <input v-model="signIn.email" :style="signIn.email ? 'width: 212px' : ''" type="email" class="form__field"/>
          <button v-if="!signIn.email"
                  type="button"
                  class="btn btn--primary btn--inside "
                  title="Meu e-mail principal"
          >
            E-mail
          </button>
          <input v-model="signIn.password" :style="signIn.password ? 'width: 212px' : ''"
                 type="email"
                 class="form__field"
                 title="Minha senha secreta"
          />
          <button v-if="!signIn.password" type="button" class="btn btn--primary btn--inside ">
            Senha
          </button>
          <button ref="button_submit-1" v-on:click.prevent="updateButtonMsg(1)"
                  :class="['submit-button state-0', handleSubmitClass('sign_in')]"><span
              class="pre-state-msg">Acessar</span><span
              class="current-state-msg hide">Validando...</span><span class="done-state-msg hide">Finalizado!</span>
          </button>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-right">
            <h1>Olá, amigo</h1>
            <p>Insira seus dados pessoais e comece a jornada conosco!</p>
            <span
                v-on:click="signInUp"
                class="button"
                style="letter-spacing: 3px;font-size: 12px"
            >
              JÁ POSSUI UMA CONTA?
              <div class="button__horizontal"></div>
              <div class="button__vertical"></div>
            </span>
          </div>
          <div class="overlay-panel overlay-left">
            <h1>Bem vindo!</h1>
            <p>Para se manter conectado conosco, faça o login com suas informações pessoais</p>
            <span
                v-on:click="signInDown"
                class="button"
                style="letter-spacing: 3px;font-weight: bold;font-size: 12px"
            >
              NOVO POR AQUI?
              <div class="button__horizontal"></div>
              <div class="button__vertical"></div>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";

export default defineComponent({
  name: "Home",
  components: {},
  data() {
    return {
      signUp: {
        name: '',
        email: '',
        password: '',
      },
      signIn: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    signInUp() {
      //   const signUpButton = this.$refs
      // console.log(ref('signUp'))

      this.signIn = {
        email: '',
        password: ''
      }
      // self.signIn = newSignIn

      const container: any = this.$refs.container;

      setTimeout(function () {
        container.classList.add("right-panel-active");
      }, 500);

      // ref('container')
    },
    signInDown() {

      this.signUp = {
        name: '',
        email: '',
        password: ''
      }

      const container: any = this.$refs.container;

      setTimeout(function () {
        container.classList.remove("right-panel-active");
      }, 500);
    },
    handleSubmitClass(event: string) {

      switch (event) {
        case 'sign_in':
          if (this.signIn.email && this.signIn.password) {
            return 'submit-button-color-advance'
          } else {
            return 'submit-button-color'
          }
        case 'sign_up':
          if (this.signUp.email && this.signUp.name && this.signUp.password) {
            return 'submit-button-color-advance'
          } else {
            return 'submit-button-color'
          }
      }
    },
    updateButtonMsg(id: number) {

      // REFATORAR O IF

      if (this.signIn.email && this.signIn.password
          || this.signUp.email && this.signUp.name && this.signUp.password) {

        const self = this;

        const button: any = this.$refs['button_submit-' + id];

        console.log(button)

        button.classList.remove("submit-button-color");
        button.classList.add("state-1", "animated", "submit-button-color-1");

        setTimeout(() => self.finalButtonMsg(id), 2000);
      }

    },
    finalButtonMsg(id: number) {
      const self = this;

      const button: any = this.$refs['button_submit-' + id];


      button.classList.add("state-2");

      setTimeout(() => self.setInitialButtonState(id), 2000);
    },
    setInitialButtonState(id: number) {
      const self = this;

      const button: any = this.$refs['button_submit-' + id];

      this.signUp = {
        name: '',
        email: '',
        password : ''
      }
      this.signIn = {
        email: '',
        password: ''
      }

      button.classList.remove("submit-button-color-1");
      button.classList.add("submit-button-color");
      button.classList.remove("state-1", "state-2", "animated");
    },
  },
});
</script>

<style>
@import url("https://fonts.googleapis.com/css?family=Montserrat:400,800");

* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  /*overflow: hidden;*/
}

.login {
  /*width: 100%;*/
  display: flex;
  background-size: cover;
  /*padding: 50px 0;*/
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: "Montserrat", sans-serif;
  height: 100%;
  /*margin: 0px 0 50px;*/
  overflow: hidden;
}

.background::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: .1;
  z-index: -1;
  background: url("https://media1.giphy.com/media/TlK63EVRw8pOCAJTeI8/source.gif");
}

h1 {
  font-weight: bold;
  margin: 0;
}

h2 {
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 100;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

@import url("https://fonts.googleapis.com/css?family=Raleway:400,400i,700");

form {
  background-color: #ffffff;
  margin-top: 100px;
  font: 1rem "PT Sans", sans-serif !important;
  /*display: flex;*/
  /*align-items: center;*/
  /*justify-content: center;*/
  flex-direction: column;
  /*padding: 0 50px;*/
  height: 100%;
  /*text-align: center;*/
}

a:hover {
  color: #7f8ff4;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.uppercase {
  text-transform: uppercase;
}

.btn {
  display: inline-block;
  background: transparent;
  color: inherit;
  font: inherit;
  border: 0;
  outline: 0;
  padding: 0;
  transition: all 200ms ease-in;
  cursor: pointer;
}

.btn--inside {
  margin-left: -100px;
}

.form__field {
  background: #fff;
  color: #2c3e50;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  width: 70%;
  padding: 22px 18px;
  margin-top: 25px;
}

/*************  max-width 600px MAIN *******************/

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

/*@media */

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}

.container.right-panel-active .overlay-container {
  transform: translateX(-100%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: -80px;
  height: 100%;
  width: 50%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.overlay-left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
  transform: translateX(0);
}

.overlay-right {
  right: 0;
  /*margin-bottom: 200px;*/
  transform: translateX(0);
}

.container.right-panel-active .overlay-right {
  transform: translateX(20%);
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #dddddd;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

/*## button sign option*/

.button {
  --offset: 10px;
  --border-size: 2px;
  display: block;
  position: relative;
  padding: 1.5em 3em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 0;
  background: transparent;
  color: #f6f5f7;
  text-transform: uppercase;
  letter-spacing: 0.25em;
  outline: none;
  cursor: pointer;
  font-weight: bold;
  border-radius: 0;
  box-shadow: inset 0 0 0 var(--border-size) currentcolor;
  transition: background 0.8s ease;
}

.button__horizontal,
.button__vertical {
  position: absolute;
  top: var(--horizontal-offset, 0);
  right: var(--vertical-offset, 0);
  bottom: var(--horizontal-offset, 0);
  left: var(--vertical-offset, 0);
  transition: transform 0.8s ease;
  will-change: transform;
}

.button__horizontal::before,
.button__vertical::before {
  content: "";
  position: absolute;
  border: inherit;
}

.button__horizontal {
  --vertical-offset: calc(var(--offset) * -1);
  border-top: var(--border-size) solid currentcolor;
  border-bottom: var(--border-size) solid currentcolor;
}

.button__horizontal::before {
  top: calc(var(--vertical-offset) - var(--border-size));
  bottom: calc(var(--vertical-offset) - var(--border-size));
  left: calc(var(--vertical-offset) * -1);
  right: calc(var(--vertical-offset) * -1);
}

.button:focus .button__horizontal {
  transform: scaleX(0);
}

.button__vertical {
  --horizontal-offset: calc(var(--offset) * -1);
  border-left: var(--border-size) solid currentcolor;
  border-right: var(--border-size) solid currentcolor;
}

.button__vertical::before {
  top: calc(var(--horizontal-offset) * -1);
  bottom: calc(var(--horizontal-offset) * -1);
  left: calc(var(--horizontal-offset) - var(--border-size));
  right: calc(var(--horizontal-offset) - var(--border-size));
}

.button:focus .button__vertical {
  transform: scaleY(0);
}

/*button confirm */

@import url("https://fonts.googleapis.com/css?family=Open+Sans:600");
@-webkit-keyframes short-press {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(0.9);
  }
  100% {
    transform: scale(1);
  }
}

@keyframes short-press {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(0.9);
  }
  100% {
    transform: scale(1);
  }
}

.hide {
  display: none;
}

.submit-button {
  display: block;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.75em;
  letter-spacing: 2px;
  height: 60px;
  width: 150px;
  align-items: center;
  margin-left: 94px;
  line-height: 38px;
  overflow: hidden;
  margin-top: 50px;
  border-radius: 3px;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  border: 1px solid #2c3e50;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-button-1 {
  display: block;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.75em;
  letter-spacing: 2px;
  height: 60px;
  width: 150px;
  align-items: center;
  margin-left: 30px;
  line-height: 38px;
  overflow: hidden;
  margin-top: 50px;
  border-radius: 3px;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  border: 1px solid #2c3e50;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-button:active {
  border: none;
}

.submit-button-color {
  /*background: #F4A460;*/
  /*background: #F4A460;*/
  cursor: unset;
  pointer-events: none;
  background: -webkit-linear-gradient(to bottom, #6772D7, #6772D7);
  background: linear-gradient(to top, #6772D7, #6772D7);
}

.submit-button-color-advance {
  /*background: #F4A460;*/
  /*background: #F4A460;*/

  background: -webkit-linear-gradient(to bottom, #6772D7, #6772D7);
  background: linear-gradient(to top, #6772D7, #6772D7);
}

.submit-button-color-1 {
  background: #6772D7;
}

.submit-button:hover,
.submit-button:focus {
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.submit-button.animated {
  -webkit-animation: 0.75s short-press cubic-bezier(0.77, 0, 0.175, 1) forwards;
  animation: 0.75s short-press cubic-bezier(0.77, 0, 0.175, 1) forwards;
}

.submit-button > span {
  display: block;
  color: white;
  text-align: center;
}

.submit-button > span.pre-state-msg {
  transition: all 0.7s cubic-bezier(0.77, 0, 0.175, 1);
  transition-delay: 0.75s;
}

.submit-button.state-0 .pre-state-msg {
  margin-top: 12px;
}

.submit-button.state-1 .pre-state-msg {
  margin-top: -28px;
}

.submit-button.state-2 .pre-state-msg {
  margin-top: -78px;
}

/*************  max-width 600px MAIN *******************/

@media only screen and (max-width: 600px) {
  .container {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
    position: relative;
    overflow: hidden;
    width: 100vw;
    max-width: 100%;
    /*height: 300px;*/
    height: 90vh;
    object-fit: cover;
    min-height: 500px;
    transform: scale(0.8);
    /*transform-origin: 0 0;*/
  }

  .overlay-container {
    position: absolute;
    top: 0;
    /*left: 50%;*/
    width: 100%;
    height: 50%;
    overflow: hidden;
    transition: transform 0.6s ease-in-out;
    z-index: 100;
    line-height: 300px;
  }

  .form-container {
    top: 0;
    transition: all 0.6s ease-in-out;
    height: 300px;
    line-height: 300px;
    position: unset;
  }

  .form {
    margin-top: 0;
  }

  .sign-in-container {
    left: 0;
    width: 100%;
    z-index: 2;
  }

  .overlay {
    background: #F4A460;
    background: -webkit-linear-gradient(to top, #F4A460, #FFDEAD);
    background: linear-gradient(to top, #F4A460, #FFDEAD);
    background-repeat: repeat;
    background-size: cover;
    background-position: 0 0;
    color: #ffffff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
  }

  .overlay-left {
    float: right;
  }

  .container.right-panel-active .overlay {
    transform: translateX(50%);
  }

  .btn--primary {
    display: none;
    background: #809fff;
    color: #fff;
    box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
    border-radius: 2px;
    padding: 12px 36px;
    border: 2px solid black; /* Green */
  }


  .form__field {
    padding: 16px 12px !important;
  }
}

/*************  min-width 600px MAIN *******************/
@media only screen and (min-width: 600px) {
  .btn--primary {
    background: #4169D7;
    color: white;
    opacity: 35%;
    box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
    border-radius: 2px;
    padding: 12px 36px;
    cursor: unset;
    border: 1px solid black;
  }

  .container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
    position: relative;
    overflow: hidden;
    width: 550px;
    /*min-width: 600px;*/
    max-width: 100%;
    /*height: 300px;*/
    margin-top: 25px;
    height: 90vh;
    object-fit: cover;
    min-height: 500px;
    transform: scale(0.8);
    /*transform-origin: 0 0;*/
  }

  .overlay-container {
    position: absolute;
    top: 0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: transform 0.6s ease-in-out;
    z-index: 100;
  }

  .form-container {
    position: absolute;
    top: 0;
    height: 100%;
    transition: all 0.6s ease-in-out;
  }

  .sign-in-container {
    left: 0;
    width: 50%;
    z-index: 2;
  }

  .overlay {
    background: #F4A460;
    background: -webkit-linear-gradient(to top, #6772D7, #96B1E6);
    background: linear-gradient(to top, #6772D7, #96B1E6);
    background-repeat: repeat;
    background-size: cover;
    background-position: 0 0;
    color: #ffffff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
  }

  .container.right-panel-active .overlay {
    transform: translateX(50%);
  }
}
</style>
