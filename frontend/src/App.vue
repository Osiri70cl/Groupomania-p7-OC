<template>
  <Header />
  <router-view />
  <Footer />
</template>

<script>
// Utilisaton du header et du footer pour l'ensemble de l'app
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

export default {
  name: "App",
  components: { Header, Footer },
};
</script>

<style>
#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background-color: white;
}

html,
body {
  margin: 0;
  padding: 0;
  height: 100%;
}
h1,
h2,
p,
h3,
h4 {
  font-family: "Lato", sans-serif;
}
</style>
