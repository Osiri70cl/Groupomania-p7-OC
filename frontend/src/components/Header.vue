<template>
  <header>
    <nav :class="{ scrolled: !view.atTopOfPage }" class="nav">
      <!-- Liens vers nos pages enregistrées dans le routeur -->
      <div class="imgdiv">
        <router-link v-if="status == 'isConnected'" to="/wall">
          <img
            class="imgLogoG"
            src="../assets/icons/icon-white-navbar.png"
            alt="Groupomania logo"
          />
        </router-link>
        <router-link v-else to="/">
          <img
            class="imgLogoG"
            src="../assets/icons/icon-white-navbar.png"
            alt="Groupomania logo"
          />
        </router-link>
      </div>
      <div class="allLinks">
        <!-- S'affiche uniquement si l'utilisateur est connecté -->
        <template v-if="status == 'isConnected'">
          <router-link to="/wall" class="internalLink">Accueil</router-link>
          <router-link to="/profil" class="internalLink">Profil</router-link>
          <router-link to="/login" @click="logOut()" class="internalLink"
            >Déconnexion</router-link
          >
        </template>

        <!-- S'affiche uniquement si l'utilisateur n'est pas connecté ou déconnecté-->
        <template v-else>
          <router-link to="/login" class="externalLink">Connexion</router-link>
          <router-link to="/signup" class="externalLink"
            >Inscription</router-link
          >
        </template>
      </div>
    </nav>
  </header>
</template>

<script>
import { mapState } from "vuex"; // Nous avons besoin d'une valeur du store Vuex pour gérer afficher des élements du header

export default {
  name: "Header",

  data() {
    return {
      view: {
        atTopOfPage: true,
      },
    };
  },

  beforeMount() {
    window.addEventListener("scroll", this.handleScroll); // On écoute l'évènement scroll
  },

  computed: {
    ...mapState(["status"]), // Le statut "isConnected" sera recherché dans le store

    userConnected() {
      // Permet de faire pointer le router vers l'id de l'utilisateur courant
      return this.$store.state.user.userId;
    },
  },

  methods: {
    handleScroll() {
      // Cette méthode s'active lors du scroll
      if (window.pageYOffset > 0) {
        if (this.view.atTopOfPage) this.view.atTopOfPage = false;
      } else {
        if (!this.view.atTopOfPage) this.view.atTopOfPage = true;
      }
    },

    logOut: function () {
      // Retour sur la page de connexion après la déconnexion
      this.$store.dispatch("logOut").then(() => {
        this.$router.push("/login");
      });
    },
  },
};
</script>

<style>
.nav {
  height: 100px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  z-index: 10;
  background-color: rgb(0, 0, 0);
}
.imgdiv {
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.imgLogoG {
  padding: 10px;
  height: 100px;
  width: 100%;
}
.allLinks {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  height: 100%;
  cursor: pointer;
}

.internalLink {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: bold;
  padding: 0.5rem;
  border-radius: 5px;
  background-color: #4e5166;
  margin: 0.5rem;
  cursor: pointer;
}
.externalLink {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: bold;
  padding: 0.5rem;
  border-radius: 5px;
  background-color: #4e5166;
  margin: 0.5rem;
  cursor: pointer;
}

.internalLink:hover {
  background-color: rgba(255, 0, 0, 0.8);
  cursor: pointer;
}
.externalLink:hover {
  background-color: rgba(255, 0, 0, 0.8);
  cursor: pointer;
}

@media (max-width: 750px) {
  .nav {
    height: 100%;
    justify-content: center;
  }
  .allLinks {
    margin-bottom: 20px;
  }
}
</style>
