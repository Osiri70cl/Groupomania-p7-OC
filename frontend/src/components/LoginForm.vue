<template>
  <article class="form-container-login">
    <form class="form">
      <div class="input-div">
        <input
          v-model="username"
          class="inputs"
          type="text"
          placeholder="Votre pseudo"
          aria-label="pseudo"
        />
        <input
          v-model="password"
          class="inputs"
          type="password"
          placeholder="Votre mot de passe"
          aria-label="mot de passe"
        />
      </div>
      <div class="button-div">
        <button
          type="button"
          aria-label="se connecter"
          @click="logToAccount()"
          class="inputButton"
          :disabled="!validatedFields"
          :class="{ 'opacity-25 cursor-not-allowed': !validatedFields }"
        >
          <span v-if="status == 'loading'">Connexion en cours...</span>
          <span v-else>Connexion</span>
        </button>
      </div>
      <div>
        <p v-if="status == 'error'" class="">
          Identifiant ou mot de passe incorrect.
        </p>
      </div>
    </form>
  </article>
</template>

<script>
import { mapState } from "vuex"; // mapState nous permet de récupérer des propriétés de state du store

export default {
  name: "loginForm",

  data: function () {
    return {
      username: "",
      password: "",
    };
  },

  computed: {
    // Fonction qui va permettre de désactiver le bouton connexion si les champs ne sont pas remplus
    validatedFields: function () {
      if (this.usermane != "" && this.password != "") {
        return true;
      } else {
        return false;
      }
    },
    ...mapState(["status"]), // On souhaite récupérer les stats status du store
  },

  methods: {
    logToAccount: function () {
      const self = this;
      this.$store
        .dispatch("logToAccount", {
          // On propage l'action createAccount du store avec l'objet présent
          username: this.username,
          password: this.password,
        })
        .then(
          function () {
            self.$router.push("/wall"); // Puis on bascule sur la page wall
          },
          function (error) {
            console.log(error);
          }
        );
    },
  },
};
</script>

<style>
.form-container-login {
  display: flex;
  flex-direction: column;
  background-color: rgba(255, 255, 255, 0.918);
  border-radius: 0 20px 20px 0;
  width: 100%;
  height: 100%;
  margin-top: 40px;
}

.input-div {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin-bottom: 30px;
}
.inputs {
  width: 100%;
  height: 40px;
  border-radius: 5px;
  border: 1px solid #e0e0e0;
  padding: 0 10px;
  margin: 20px;
}
.button-div {
  display: flex;
  justify-content: center;
  align-items: center;
}
.inputButton {
  width: 100%;
  height: 40px;
  border-radius: 5px;
  border: 1px solid #e0e0e0;
  padding: 0 10px;
  margin-bottom: 10px;
  background-color: #1f1f1f;
  color: #ebebeb;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
}
.inputButton:hover {
  background-color: #ff0000;
  color: #ffffff;
}
</style>
