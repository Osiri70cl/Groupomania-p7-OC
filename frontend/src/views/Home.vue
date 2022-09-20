<template>
  <main class="main">
    <h1 class="title">Réseau Groupomania</h1>
    <section class="welcomeSection">
      <article class="welcomeText">
        <p class="text">
          Groupomania est heureux de vous présenter son réseau social !<br /><br />
          N'attendez plus et venez rejoindre vos collègues parmis nous ! Venez
          découvrir les nombreuses fonctionnalitées que nous avons à vous offrir
          !<br /><br />
          Pour cela il suffit de vous connecter, ou de vous inscrire si cela
          n'est pas déjà fait
        </p>
        <article class="buttonArea">
          <button @click="toLogin()" class="textButton pink">
            Déjà inscrit ?
          </button>
          <button @click="toSignup()" class="textButton red">S'inscrire</button>
        </article>
      </article>
    </section>
  </main>
</template>

<script>
export default {
  name: "Home",
  methods: {
    // Utilisation d'instances router pour créer des ancres
    toLogin() {
      this.$router.push({ path: "/login" });
    },
    toSignup() {
      this.$router.push({ path: "/signup" });
    },
  },
};
</script>
<style>
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.title {
  margin-top: 50px;
  padding: 20px;
  border-radius: 20px;
  font-size: 32px;
  color: black;
}

.welcomeSection {
  margin: 50px auto;
  max-width: 850px;
}

.welcomeText {
  width: 100%;
  background-color: #4e5166;
  border-radius: 20px;
  padding: 30px;
}
.buttonArea {
  display: flex;
  align-items: center;
  justify-content: center;
}

.text {
  font-size: 24px;
  margin-top: 50px;
  margin-bottom: 50px;
  text-align: center;
  color: white;
}
.textButton {
  margin: 10px;
  padding: 10px;
  border-radius: 5px;
  border: none;

  font-size: 1.2em;
  font-weight: bold;
}

.textButton:hover {
  cursor: pointer;
  background-color: #4e5166;
  border: 1px solid white;
}
.red {
  background-color: #fd2d01;
  color: white;
  border: 1px solid #fd2d01;
}

.pink {
  background-color: #ffcece;
  color: #2c3e50;
  border: 1px solid #ffcece;
}
.pink:hover {
  color: white;
}

@media screen and (max-width: 1000px) {
  .welcomeText {
    overflow-y: scroll;
  }
}
</style>
