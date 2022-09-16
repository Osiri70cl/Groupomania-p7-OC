<template>
  <div class="main">
    <h1 class="title-form">Inscrivez-vous dès aujourd'hui !</h1>
    <div class="welcomeSection">
      <div id="login-form" class="formLayout">
        <signupForm />
      </div>
    </div>
  </div>
</template>

<script>
// Utilisation du component formulaire de connexion
import signupForm from "../components/SignupForm.vue";

export default {
  name: "Signup",
  components: { signupForm },
};
</script>
<style>
.title-form {
  margin-top: 50px;
  padding: 20px;
  border-radius: 20px;
  font-size: 32px;
  color: white;
  background-color: #4e5166;
}
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.welcomeSection {
  margin: 50px auto;
  max-width: 850px;
  height: 500px;
}

.formLayout {
  width: 100%;
  height: 100%;
}
</style>
