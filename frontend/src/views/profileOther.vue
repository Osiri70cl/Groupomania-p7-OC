<template>
  <div class="mainProfilArea">
    <div class="mainProfilArea-center">
      <div
        v-if="
          $store.state.user.userId == users.id ||
          $store.state.user.isAdmin == true
        "
        class="card-top"
      >
        <div class="flex">
          <button
            type="button"
            title="Supprimer ce profil"
            @click="deleteUser(users.id)"
            class="deleteButton"
          >
            <TrashIcon class="trashIconOther" />
          </button>
        </div>
      </div>

      <div class="user-profil-main-div">
        <div class="user-profil-div">
          <img
            v-if="users.picture !== null"
            class="user-picture"
            :src="users.picture"
            alt="photo de profil"
          />
          <h1 class="user-name">
            {{ users.username }}
          </h1>
          <p class="user-fullname">
            {{ users.lastName }} {{ users.firstName }}
          </p>
          <p class="user-member-date">
            Membre depuis le
            {{ moment(users.createdAt).format("[le] DD MMMM YYYY") }}
          </p>
        </div>
      </div>
      <div class="user-div-info">
        <div class="user-info">
          <MailIcon class="icons" />
          <p class="font-light">{{ users.email }}</p>
        </div>
        <div class="user-info">
          <ChatIcon class="icons" />
          <p class="font-light">A propos</p>
        </div>
        <div class="user-info-text">
          <p class="user-text">
            {{ users.description }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import moment from "moment";

import { MailIcon, ChatIcon, TrashIcon } from "@heroicons/vue/solid";

export default {
  name: "Profil",
  components: { MailIcon, ChatIcon, TrashIcon },

  data: () => ({
    showModal: false, // La modale ne doit pas d'afficher initialement
  }),

  beforeMount() {
    this.$store.dispatch("getOtherUser", this.$route.params.id); // On récupére les infos de l'user en fonction de l'id de l'URL
  },

  created: function () {
    this.moment = moment; // Permet le formatage de la date de création
    moment.locale("fr");
  },

  methods: {
    deleteUser(id) {
      this.$store.dispatch("deleteOneUser", id);
      this.$router.push("/wall");
    },
  },

  computed: {
    ...mapState({
      users: (state) => state.users, // On map les infos user récupérées avec le dispatch
    }),
  },
};
</script>
<style>
.user-profil-main-div {
  margin-top: 20px;
}
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
  margin: 40px;
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
.flex {
  margin: 5px;
  display: flex;
}

.trashIconOther {
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
  line-break: anywhere;
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
  font-size: 1.2rem;
  font-style: italic;
  color: rgb(88, 88, 88);
}
.font-light {
  font-weight: 500;
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
