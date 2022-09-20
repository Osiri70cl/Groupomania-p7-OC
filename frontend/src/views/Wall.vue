<template>
  <div class="core">
    <div class="feed">
      <div class="userFeed">
        <img
          v-if="user.picture !== null"
          class="userPicture"
          :src="user.picture"
          alt="photo de profil"
        />
        <button type="button" @click="displayModal" class="postButton">
          <div class="newPostBanner">
            <h2 class="newPostText">Nouveau post</h2>
            <PencilAltIcon class="newPostIcon" />
          </div>

          <post-modal v-show="showModal" @close="closeModal" />
          <!-- Le composant modal s'affiche au click -->
        </button>
      </div>

      <div v-if="$store.state.posts == 0" class="div-text">
        <p class="textNoPost">
          Aucune publications !<br />
          Soyez le premier ou la première à créer un post 😄 !
        </p>
      </div>

      <postView v-for="post of posts" :key="post.id" :post="post" :id="post.id">
        <!-- Le contenu itéré sera affiché via le composant post.vue -->
      </postView>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

import postModal from "../components/PostModal.vue";
import postView from "../components/Post.vue";

import { PencilAltIcon } from "@heroicons/vue/solid";

export default {
  name: "Wall",
  components: { postModal, postView, PencilAltIcon },

  data: () => ({
    showModal: false, // La modale ne doit pas d'afficher initialement
  }),

  beforeMount() {
    // On demande les informations de l'user ainsi que les posts disponibles avant le rendu
    this.$store.dispatch("getUserInfos");
    this.$store.dispatch("getAllPosts");
  },

  methods: {
    displayModal() {
      this.showModal = true;
      this.$router.push("/posts/add");
    },

    closeModal() {
      this.showModal = false;
      this.$router.push("/wall");
    },
  },

  computed: {
    ...mapState({
      user: (state) => state.user,
      posts: (state) => state.posts,
    }),

    dayName() {
      // Récupération du jour actuel
      const dateObj = new Date();
      const weekday = dateObj.toLocaleString("fr-FR", { weekday: "long" });
      return `${weekday}`;
    },
  },
};
</script>
<style>
.newPostBanner {
  display: flex;
  justify-content: center;
  align-items: center;
}
.newPostBanner:hover {
  cursor: pointer;
}
.newPostIcon {
  margin-left: 20px;
  height: 45px;
  width: 45px;
  color: white;
}
.newPostText {
  font-size: 32px;
  color: white;
}

.core {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  background-color: #4e5166;
}
.feed {
  background-color: white;
  height: 100%;
}
.userFeed {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin: 50px 30px;
}
.userPicture {
  width: 130px;
  height: 130px;
  margin: 10px;
  border: 3px solid grey;
  object-fit: cover;
  border-radius: 50%;
}
.postButton {
  max-width: 70%;
  height: 80px;
  padding: 10px;
  background-color: #4e5166;
  border-radius: 16px;
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
}
.postButton:hover {
  box-shadow: 0px 0px 30px #00000067;
}

.div-text {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 100px;
  margin-bottom: 200px;
}
.textNoPost {
  align-self: center;
  color: grey;
}

/* MEDIA QUERIES  */

@media screen and (min-width: 750px) {
  .feed {
    max-width: 70%;
    border-radius: 40px;
    margin: 60px 0px;
  }
}

@media screen and (max-width: 750px) {
  .feed {
    width: 100%;
    border-radius: none;
    margin: 0;
  }

  .userFeed {
    flex-direction: column;
  }

  .postButton {
    width: 100%;
    height: 50px;
  }

  .newPostBanner {
    width: 100%;
    height: 100%;
  }
  .newPostText {
    font-size: 20px;
  }
  .newPostIcon {
    height: 30px;
    width: 30px;
  }
}
</style>
