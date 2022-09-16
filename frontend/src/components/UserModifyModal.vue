<template>
  <transition name="modal-fade">
    <div class="modal-main-div" @click.stop>
      <div class="modal-main">
        <div class="modal-backdrop">
          <div
            class="modal-main-content"
            role="dialog"
            aria-modal="true"
            aria-label="modal modification de post"
          >
            <div class="button-div">
              <button
                type="button"
                aria-label="fermer"
                @click="close"
                class="closeButton"
              >
                <XCircleIcon class="crossIcon" />
              </button>
            </div>
            <h2 class="modal-title">Modifier un profil</h2>

            <form>
              <div>
                <textarea
                  v-model="username"
                  class="modal-textArea-user"
                  type="text"
                  placeholder="Nom d'utilisateur"
                  aria-label="Changer nom d'utilisateur"
                />
              </div>

              <div>
                <textarea
                  v-model="description"
                  class="modal-textArea-about"
                  type="text"
                  placeholder="A propos de vous"
                  aria-label="Changer de description"
                />
              </div>

              <span class="subtext">Modifier votre photo de profil</span>
              <input
                @change="uploadFile"
                ref="file"
                label
                for="image"
                name="image"
                class="modal-input-file"
                type="file"
                accept="image/png, image/jpeg, image/gif"
                aria-label="Changer la photo de profil"
              />

              <div class="flex justify-center">
                <button
                  type="button"
                  @click="
                    updateProfil();
                    close();
                  "
                  class="modify-button"
                  :disabled="!validatedFields"
                >
                  <span v-if="messages == 'Post modifié !'"
                    >Modification en cours...</span
                  >
                  <span v-else>Modifier</span>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { XCircleIcon } from "@heroicons/vue/solid";
import { mapState } from "vuex";

export default {
  name: "modifyModal",

  components: { XCircleIcon },

  data: function () {
    return {
      username: "",
      email: "",
      description: "",
      file: null,
    };
  },

  computed: {
    ...mapState({
      messages: (state) => state.message,
      user: (state) => state.user,
    }),

    validatedFields: function () {
      if (
        this.username !== "" ||
        this.description !== "" ||
        this.file !== null
      ) {
        return true;
      } else {
        return false;
      }
    },
  },

  methods: {
    uploadFile() {
      const file = this.$refs.file.files[0];
      this.file = file;
    },

    updateProfil: function () {
      // Même schéma que pour la création des posts, mis à part que le payload comporte l'id du post en plus du data

      let id = this.$store.state.user.userId;

      const formData = new FormData();

      if (this.username !== "") {
        formData.append("username", this.username);
      }

      if (this.description !== "") {
        formData.append("description", this.description);
      }
      if (this.file !== null) {
        formData.append("image", this.file);
      }

      this.$store.dispatch("updateUserInfos", {
        id: id,
        data: formData,
      });
    },

    close() {
      this.$emit("close");
    },
  },
};
</script>

<style>
.modal-fade-enter,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.5s ease-in-out;
}

.modal-main-div {
  position: relative;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9999;
}

.modal-main {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9999;
  backdrop-filter: blur(20px);
}

.modal-backrop {
  overflow-y: auto;
  background-color: rgba(128, 128, 128, 0.445);
}

.modal-main-content {
  margin: auto;
  top: 100px;
  position: relative;
  background-color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 50%;
  border: 2px solid grey;
  border-radius: 20px;
  padding: 40px;
}
.closeButton {
  position: absolute;
  top: -4px;
  right: -4px;
}

.crossIcon {
  height: 50px;
  width: 50px;
  color: #ff6b6b;
}
.modal-title {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
}
.modal-textArea-user {
  padding: 10px;
  height: 50px;
  width: 100%;
  border-radius: 20px;
  border: 2px solid grey;
}
.modal-textArea-about {
  padding: 10px;
  height: 100px;
  width: 100%;
  border-radius: 20px;
  border: 2px solid grey;
}
.modal-input-file {
  padding: 10px;
  height: 50px;
  width: 100%;
  border-radius: 20px;
  border: 2px solid grey;
}
.subtext {
  font-size: 0.8rem;
  margin-top: 10px;
  margin-bottom: 10px;
}
.modify-button {
  margin: 20px;
  padding: 20px;
  background-color: #444444;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 40px;
}
.modify-button:hover {
  background-color: #ff6b6b;
}

@media (max-width: 750px) {
  .modal-main-content {
    width: 90%;
  }
}
</style>
