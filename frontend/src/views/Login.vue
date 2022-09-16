<template>
  <div class="main">
    <h1 class="title-login">Nous vous attendions !</h1>
    <div class="welcomeSection">
      <div id="login-form" class="loginForm">
        <loginForm />
      </div>
    </div>
  </div>
</template>

<script>
// Utilisation du component formulaire de connexion
import loginForm from "../components/LoginForm.vue";

export default {
  name: "Login",
  components: { loginForm },
};
</script>
<style>
.title-login {
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
  backdrop-filter: blur(10px);
}

.welcomeSection {
  margin: 50px auto;
  max-width: 850px;
  height: 500px;
}
</style>
