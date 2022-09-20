<template>
  <article class="form-container">
    <form class="form">
      <div class="input-div-signup">
        <input
          v-model="firstName"
          class="inputs"
          type="text"
          placeholder="Votre nom"
          aria-label="nom"
        />
        <input
          v-model="lastName"
          class="inputs"
          type="text"
          placeholder="Votre prénom"
          aria-label="prénom"
        />
        <input
          v-model="username"
          class="inputs"
          type="text"
          placeholder="Un pseudo"
          aria-label="pseudo"
        />
        <input
          v-model="email"
          class="inputs"
          type="text"
          placeholder="Votre adresse mail"
          aria-label="email"
        />
        <input
          v-model="password"
          class="inputs"
          type="password"
          placeholder="Un mot de passe"
          aria-label="mot de passe"
        />
        <input
          v-model="confirmPassword"
          class="inputs"
          type="password"
          placeholder="confirmer le mot de passe"
          aria-label="confirmer le mot de passe"
        />
      </div>
      <div class="button-div">
        <button
          type="button"
          aria-label="inscription"
          @click="createAccount()"
          class="inputButton"
          :disabled="!validatedFields"
          :class="{ '': !validatedFields }"
        >
          <!-- Au click l'intitulé du bouton change -->
          <span v-if="status == 'loading'">Création du compte en cours...</span>
          <span v-else>Créer et débuter l'aventure</span>
        </button>
      </div>
      <!-- Un message d'erreur apparaît si le formulaire n'est pas valide -->
      <div>
        <p v-if="status == 'error'" class="">
          Inscription impossible, veuillez vérifier les informations
          renseignées.
        </p>
      </div>
    </form>

    <div class="sous-div">
      <p class="sous-texte">
        Veillez à remplir l'ensemble des informations demandées.
      </p>
      <p class="sous-texte">
        Le mot de passe doit contenir au minimum 8 caractères, au moins une
        majuscule, une minuscule, et un chiffre. Il ne doit pas contenir
        d'espaces.
      </p>
    </div>
  </article>
</template>

<script>
import { mapState } from "vuex"; // mapState nous permet de récupérer des propriétés de state du store

export default {
  name: "signupForm",

  data: function () {
    return {
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      password: "",
      confirmPassword: "",
    };
  },

  computed: {
    // Fonction qui va permettre de désactiver le bouton d'inscription si les champs ne sont pas remplis
    validatedFields: function () {
      if (
        this.firstName != "" &&
        this.lastName != "" &&
        this.username != "" &&
        this.email != "" &&
        this.password != "" &&
        this.confirmPassword === this.password
      ) {
        return true;
      } else {
        return false;
      }
    },
    ...mapState(["status"]), // On souhaite récupérer les stats status du store
  },

  methods: {
    createAccount: function () {
      const self = this; // Afin d'utiliser this dans un autre contexte
      this.$store
        .dispatch("createAccount", {
          // On propage l'action createAccount du store avec l'objet présent
          firstName: this.firstName,
          lastName: this.lastName,
          username: this.username,
          email: this.email,
          password: this.password,
        })
        .then(
          function () {
            self.$router.push("/login"); // Puis on retourne sur la page login afin de se connecter
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
.form-container {
  width: 100%;
  height: 100%;
}

.form {
  padding: 20px;
}
.input-div-signup {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.inputs {
  width: 75%;
  height: 40px;
  border-radius: 5px;
  border: 1px solid #e0e0e0;
  padding: 0 10px;
  margin-bottom: 10px;
}

.button-div {
  display: flex;
  justify-content: center;
  align-items: center;
}
.inputButton {
  width: 75%;
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

.sous-texte {
  font-size: 16px;
  font-style: italic;
  color: rgb(158, 158, 158);
}

.sous-div {
  margin: auto;
  width: 70%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
}

@media (max-width: 750px) {
  .form-container {
    overflow-y: scroll;
  }
}
</style>
