<template>
  <transition name="modal-fade">
    <div class="main-div" @click.stop>
      <div class="background">
        <div class="modal-behavior">
          <div
            class="modal"
            role="dialog"
            aria-modal="true"
            aria-label="modal création de post"
          >
            <div>
              <button
                type="button"
                aria-label="fermer"
                @click="close"
                class="closeButton"
              >
                <XCircleIcon class="circleIcon" />
              </button>
            </div>
            <h2 class="Title">Créer un post</h2>

            <form>
              <div>
                <textarea
                  v-model="message"
                  class="zoneTexte"
                  type="text"
                  placeholder="Votre message"
                  aria-label="Ecrire un message"
                />

                <p class="text-sm font-thin italic text-left mb-6">
                  La publication doit contenir au moins un message, qui peut
                  être agrémenté par une image issue d'un fichier, ou d'un
                  lien.<br />
                  Les images doivent utiliser les formats suivants : .jpeg,
                  .png, .gif
                </p>

                <input
                  @change="uploadFile"
                  ref="file"
                  name="image"
                  class="files"
                  type="file"
                  accept="image/png, image/jpeg, image/gif"
                  aria-label="Rajouter un fichier"
                />

                <input
                  v-model="link"
                  class="files"
                  type="text"
                  placeholder="Votre lien"
                  aria-label="Rajouter un lien"
                />
              </div>

              <div class="flex justify-center">
                <button
                  type="button"
                  @click="
                    submitPost();
                    close();
                  "
                  class="publish"
                  :disabled="!validatedFields"
                  :class="{ 'opacity-25 cursor-not-allowed': !validatedFields }"
                >
                  <span v-if="messages == 'Post publié !'"
                    >Publication en cours...</span
                  >
                  <span v-else>Publier</span>
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
  name: "postModal",

  components: { XCircleIcon },

  data: function () {
    return {
      message: "",
      file: null,
      link: null,
    };
  },

  computed: {
    validatedFields: function () {
      if (this.message != "") {
        return true;
      } else {
        return false;
      }
    },

    ...mapState({ messages: (state) => state.message }),
  },

  methods: {
    uploadFile() {
      const file = this.$refs.file.files[0];
      this.file = file;
    },

    submitPost: function () {
      const formData = new FormData(); // Permet de transmettre le formulaire dans un format adapté au backend

      formData.append("message", this.message);

      if (this.link !== null) {
        formData.append("link", this.link);
      }
      if (this.file !== null) {
        formData.append("image", this.file);
      }
      this.$store.dispatch("createPost", formData);
    },

    resetForm() {
      // Permet de reset le formulaire
      this.message = "";
      this.link = null;
      this.$refs.file.value = null;
    },

    close() {
      this.$emit("close");
      this.resetForm(); // Reset du formulaire à la fermeture de la modal
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

.main-div {
  display: flex;
  position: fixed;
  bottom: 0px;
  inset: 0px;
}
.background {
  position: fixed;
  inset: 0px;
  transition-property: opacity;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

.modal-behavior {
  position: absolute;
  overflow-y: auto;
  inset: 0px;
  background-color: rgba(128, 128, 128, 0.404);
  backdrop-filter: blur(10px);
}
.modal {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  width: 50%;
  padding: 2rem;
  margin-left: auto;
  margin-right: auto;
  margin-top: 10rem;
  margin-bottom: 10rem;
  z-index: 10;
  border-radius: 0.5rem;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
  background-color: #fff;
  backdrop-filter: blur(10px);
}
.closeButton {
  position: absolute;
  top: -1rem;
  right: -1rem;
}
.circleIcon {
  color: rgb(255, 42, 77);
  height: 40px;
  width: 40px;
}
.circleIcon:hover {
  color: rgb(253, 85, 113);
  cursor: pointer;
}
.Title {
  flex-direction: flex-start;
  color: black;
  font-size: 1.25rem;
  line-height: 1.75rem;
  margin-bottom: 1rem;
}

.zoneTexte {
  padding: 5px;
  width: 100%;
  height: 100px;
  resize: none;
  color: black;
  border: 2px solid black;
  border-radius: 10px;
}

.files {
  width: 100%;
  outline: 2px solid transparent;
  outline-offset: 2px;
  border-radius: 10px;
  padding: 0.5rem;
  margin-bottom: 1.5rem;
  border: 2px solid rgb(199, 199, 199);
}
.publish {
  background-color: gray;
  border-radius: 10px;
  color: white;
  font-weight: 500;
  padding: 0.5rem 1rem;
  margin-left: 5rem;
  margin-right: 5rem;
}

.publish:hover {
  background-color: rgb(253, 85, 113);
}

/* MEDIA QUERIES  */

@media (max-width: 750px) {
  .modal {
    width: 90%;
  }
}
</style>
