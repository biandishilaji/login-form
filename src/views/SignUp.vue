<template>
  <div class="login">
    <div class="container" ref="container">
      <div class="form-container sign-up-container">
        <form action="#">
          <!--			<h1></h1>-->
          <form class="form" style="">
            <input type="email" class="form__field" placeholder="E-mail" />
            <button
              type="button"
              class="btn btn--primary btn--inside uppercase"
              title="Meu e-mail principal"
            >
              E-mail
            </button>
            <input type="email" class="form__field" placeholder="Nome" />
            <button
              type="button"
              class="btn btn--primary btn--inside uppercase"
              title="Meu nome completo"
            >
              Nome
            </button>
            <input
              type="email"
              class="form__field"
              placeholder="Senha"
              title="Minha senha secreta"
            />
            <button
              type="button"
              class="btn btn--primary btn--inside uppercase"
            >
              Senha
            </button>
            <!--            <button ref="button_submit" v-on:click.prevent="updateButtonMsg" class="submit-button state-0 submit-button-color"><span class="pre-state-msg">Cadastrar</span><span-->
            <!--                class="current-state-msg hide">Enviando...</span><span class="done-state-msg hide">Finalizado!</span></button>-->
          </form>
          <button @click.prevent="signInUp()">teste</button>
        </form>
      </div>
      <div class="form-container sign-in-container">
        <form class="form" style="">
          <input type="email" class="form__field" placeholder="E-mail" />
          <button
            type="button"
            class="btn btn--primary btn--inside uppercase"
            title="Meu e-mail principal"
          >
            E-mail
          </button>
          <input type="email" class="form__field" placeholder="Nome" />
          <button
            type="button"
            class="btn btn--primary btn--inside uppercase"
            title="Meu nome completo"
          >
            Nome
          </button>
          <input
            type="email"
            class="form__field"
            placeholder="Senha"
            title="Minha senha secreta"
          />
          <button type="button" class="btn btn--primary btn--inside uppercase">
            Senha
          </button>
          <!--            <button ref="button_submit" v-on:click.prevent="updateButtonMsg" class="submit-button state-0 submit-button-color"><span class="pre-state-msg">Cadastrar</span><span-->
          <!--                class="current-state-msg hide">Enviando...</span><span class="done-state-msg hide">Finalizado!</span></button>-->
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <!--				<h1>Welcome Back!</h1>-->
            <!--				<p>To keep connected with us please login with your personal info</p>-->
            <button
              v-on:click="signInDown"
              class="button"
              style="letter-spacing: 3px"
            >
              JÁ POSSUI UMA CONTA?
              <div class="button__horizontal"></div>
              <div class="button__vertical"></div>
            </button>
          </div>
          <div class="overlay-panel overlay-right">
            <!--				<h1>Olá, amigo</h1>-->
            <!--				<p>Insira seus dados pessoais e comece a jornada conosco!</p>-->
            <button
              v-on:click="signInUp"
              class="button"
              style="letter-spacing: 3px"
            >
              NOVO POR AQUI?
              <div class="button__horizontal"></div>
              <div class="button__vertical"></div>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "Home",
  components: {},
  setup() {},
  methods: {
    signInUp() {
      //   const signUpButton = this.$refs
      // console.log(ref('signUp'))

      const container: any = this.$refs.container;

      setTimeout(function () {
        container.classList.add("right-panel-active");
      }, 500);

      // ref('container')
    },
    signInDown() {
      const container: any = this.$refs.container;

      setTimeout(function () {
        container.classList.remove("right-panel-active");
      }, 500);
    },
    updateButtonMsg() {
      const self = this;

      const button: any = this.$refs.button_submit;

      button.classList.remove("submit-button-color");
      button.classList.add("state-1", "animated", "submit-button-color-1");

      setTimeout(self.finalButtonMsg, 2000);
    },
    finalButtonMsg() {
      const self = this;

      const button: any = this.$refs.button_submit;

      button.classList.add("state-2");

      setTimeout(self.setInitialButtonState, 2000);
    },
    setInitialButtonState() {
      const self = this;

      const button: any = this.$refs.button_submit;

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
}

.login {
  background: #f6f5f7;
  /*width: 100%;*/
  display: flex;
  background-size: cover;
  padding: 50px 0;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: "Montserrat", sans-serif;
  height: 100%;
  margin: -20px 0 50px;
  overflow: hidden;
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
  margin-top: 40px;
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

.btn--primary:hover {
  background: #668cff;
}

.btn--primary:active {
  background: #668cff;
  box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, 0.2);
}

.btn--inside {
  margin-left: -96px;
}

.form__field {
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  width: 70%;
  padding: 22px 18px;
  margin-top: 25px;
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
  }
  .form-container {
    position: absolute;
    top: 350px;
    height: 50%!important;
    max-height: 50%!important;
    width: 100%;
    transition: all 0.6s ease-in-out;
  }
  .sign-in-container {
    left: 0;
    width: 100%;
    z-index: 2;
  }
  .overlay {
    background: #3366ff;
    background: -webkit-linear-gradient(to top, #3366ff, #668cff);
    background: linear-gradient(to top, #3366ff, #668cff);
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
    .btn--primary {
    display: none;
    background: #809fff;
    color: #fff;
    box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
    border-radius: 2px;
    padding: 12px 36px;
  }
  .form-container {
    top: 200px !important;
  }
  .form__field {
    padding: 16px 12px !important;
        margin: 10px 0!important;
  }
  .form{
        margin: 2.5rem 0!important;
  }
  .sign-up-container{
    transform: none!important;
        width: 100%!important;
  }
}



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
  top: 0;
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

footer {
  background-color: #222;
  color: #fff;
  font-size: 14px;
  bottom: 0;
  position: fixed;
  left: 0;
  right: 0;
  text-align: center;
  z-index: 999;
}

footer p {
  margin: 10px 0;
}

footer i {
  color: red;
}

footer a {
  color: #3c97bf;
  text-decoration: none;
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
  letter-spacing: 1px;
  height: 50px;
  width: 150px;
  margin-left: 10.5rem;
  line-height: 38px;
  overflow: hidden;
  margin-top: 50px;
  border-radius: 3px;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  border: 0;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-button-color {
  background: #3366ff;
}

.submit-button-color-1 {
  background: #b3c6ff;
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
  margin-top: 5px;
}
.submit-button.state-1 .pre-state-msg {
  margin-top: -32px;
}

.submit-button.state-2 .pre-state-msg {
  margin-top: -75px;
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
    height: 300px;
    line-height: 300px;
  }
  .form-container {
    top: 0;
    transition: all 0.6s ease-in-out;
      height: 300px;
    line-height: 300px;
    position: unset;
  }
  .form{
      margin-top: 0;
  }
  .sign-in-container {
    left: 0;
    width: 100%;
    z-index: 2;
  }
  .overlay {
    background: #3366ff;
    background: -webkit-linear-gradient(to top, #3366ff, #668cff);
    background: linear-gradient(to top, #3366ff, #668cff);
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
  .overlay-left{
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
  }
  .form-container {
     
  }
  .form__field {
    padding: 16px 12px !important;
  }
}



/*************  min-width 600px MAIN *******************/
@media only screen and (min-width: 600px) {
    .btn--primary {
    background: #809fff;
    color: #fff;
    box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
    border-radius: 2px;
    padding: 12px 36px;
  }
  .container {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
    position: relative;
    overflow: hidden;
    width: 600px;
    max-width: 100%;
    /*height: 300px;*/
    height: 90vh;
    object-fit: cover;
    min-height: 375px;
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
    background: #3366ff;
    background: -webkit-linear-gradient(to top, #3366ff, #668cff);
    background: linear-gradient(to top, #3366ff, #668cff);
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
