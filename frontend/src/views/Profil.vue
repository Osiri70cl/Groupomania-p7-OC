<template>
  <div class="mainProfilArea">
    <div class="mainProfilArea-center">
      <div class="card-top">
        <div class="card-top-icons">
          <button
            type="button"
            title="Modifier votre profil"
            @click="displayModal"
            class="btn-top"
          >
            <PencilIcon class="pencilIcon" />
          </button>
          <modify-user v-show="modifyUser" @close="closeModal" />
          <button
            type="button"
            title="Supprimer votre profil"
            @click="deleteUser(user.userId)"
            class="btn-top"
          >
            <TrashIcon class="trashIcon" />
          </button>
        </div>
      </div>
      <div class="user-profil-main-div">
        <div class="user-profil-div">
          <img
            v-if="user.picture !== null"
            class="user-picture"
            :src="user.picture"
            alt="photo de profil"
          />
          <h1 class="user-name">
            {{ user.username }}
          </h1>
          <p class="user-fullname">{{ user.lastName }} {{ user.firstName }}</p>
          <p class="user-member-date">
            Membre depuis le
            {{ moment(user.birth).format("[le] DD MMMM YYYY") }}
          </p>
        </div>
      </div>
      <div class="user-div-info">
        <div class="user-info">
          <MailIcon class="icons" />
          <p class="fontText">{{ user.email }}</p>
        </div>
        <div class="user-info">
          <h3 class="fontText-title">Bio :</h3>
        </div>
        <div class="user-info-text">
          <p class="user-text">
            {{ user.description }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import moment from "moment";
import modifyUser from "../components/UserModifyModal.vue";
import { PencilIcon, MailIcon, TrashIcon } from "@heroicons/vue/solid";

export default {
  name: "Profil",
  components: { modifyUser, PencilIcon, MailIcon, TrashIcon },

  data: () => ({
    modifyUser: false, // La modale ne doit pas d'afficher initialement
  }),

  beforeMount() {
    this.$store.dispatch("getUserInfos"); // On veut récupérer les infos de l'user dès le chargement
  },
  created: function () {
    this.moment = moment; // Permet le formatage de la date de création
    moment.locale("fr");
  },

  methods: {
    displayModal() {
      this.modifyUser = true;
      this.$router.push("/profil/modify");
    },

    closeModal() {
      this.modifyUser = false;
      this.$router.push("/profil");
    },

    deleteUser(id) {
      this.$store.dispatch("deleteOneUser", id);
      this.$store.dispatch("logOut").then(() => {
        // Pour éviter des erreurs la session se ferme après la suppression de l'user
        this.$router.push("/");
      });
    },
  },

  computed: {
    ...mapState({
      user: (state) => state.user,
    }),
  },
};
</script>

<style>
.mainProfilArea {
  margin: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 90vh;
  width: 100%;
  background-color: #4e5166;
}

.mainProfilArea-center {
  width: 70%;
  height: 100%;
  background-color: white;
  border-radius: 30px;
  margin: 60px 0px;
}
.card-top {
  display: flex;
  justify-content: flex-end;
}

.card-top-icons {
  display: flex;
}
.card-top-icons:hover {
  cursor: pointer;
}

.btn-top {
  margin: 10px;
}

.pencilIcon {
  height: 35px;
  width: 35px;
  fill: rgb(68, 68, 68);
}
.trashIcon {
  height: 35px;
  width: 35px;
  fill: rgb(255, 0, 0);
}

.user-profil-main-div {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.user-profil-div {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.user-picture {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  border: 3px solid rgb(68, 68, 68);
  object-fit: cover;
}
.user-name {
  padding: 5px;
  font-size: 2rem;
  font-weight: bold;
  color: rgb(82, 82, 82);
}
.user-fullname {
  padding: 5px;
  font-size: 1.5rem;
  font-style: italic;
  color: rgb(88, 88, 88);
}
.user-member-date {
  padding: 5px;
  font-size: 1.2rem;
  font-style: italic;
  color: grey;
}

.user-div-info {
  margin: 50px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}
.user-info {
  margin-top: 10px;
  margin-bottom: 10px;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
}
.icons {
  margin-right: 10px;
  height: 30px;
  width: 30px;
  fill: rgb(68, 68, 68);
}

.user-info-text {
  height: 150px;
  margin-top: 10px;
  margin-bottom: 10px;
  display: flex;
  flex-wrap: wrap;
}
.user-text {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
  font-size: 1.2rem;
  font-style: italic;
  color: rgb(88, 88, 88);
}
.fontText {
  font-weight: 500;
  color: rgb(104, 104, 104);
}
.fontText-title {
  font-weight: 700;
  font-style: italic;
  color: rgb(104, 104, 104);
}

@media screen and (max-width: 750px) {
  .mainProfilArea {
    height: 120vh;
  }
  .mainProfilArea-center {
    width: 100%;
    height: 100%;
    background-color: white;
  }
  .user-div-info {
    margin: 30px;
  }
  .user-info-text {
    overflow-y: scroll;
  }
  .btn-top {
    margin: 20px 20px 0px 15px;
  }
}
</style>
