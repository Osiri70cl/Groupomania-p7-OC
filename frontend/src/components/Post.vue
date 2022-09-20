<template>
  <article class="post-main">
    <figure class="post-display">
      <div class="post-top">
        <div class="post-img">
          <img
            v-if="post.User.picture !== null"
            class="postImg"
            :src="post.User.picture"
            alt="photo de profil"
          />
          <router-link :to="`/profil/${post.User.id}`">
            <!-- Lien vers le profil du créateur du post -->
            <p class="post-username">
              {{ post.User.username }}
            </p>
            <p class="post-creation-date">
              {{ moment(post.createdAt).format("[le] DD MMMM YYYY") }}
            </p>
          </router-link>
        </div>
        <!-- Si l'user est le propriétaire du post ou l'admin on autorise la modification ou la suppression -->
        <div
          class="post-top-right"
          v-if="
            $store.state.user.userId == post.User.id ||
            $store.state.user.isAdmin == true
          "
        >
          <button
            type="button"
            title="Modifer ce post"
            @click="modifyPost(post.id)"
          >
            <PencilIcon class="pencilIcon" />
          </button>
          <modifyModal v-show="showModal" @close="closeModifyPost" />
          <button
            type="button"
            title="Supprimer ce post"
            @click="deletePost(post.id)"
          >
            <TrashIcon class="trashIcon" />
          </button>
        </div>
      </div>

      <div v-if="post.imageURL !== null" class="postImg-container">
        <img class="post-big-img" :src="post.imageURL" alt="image postée" />
      </div>

      <div v-if="post.link !== null" class="postImg-container">
        <img class="post-big-img" :src="post.link" alt="gif posté" />
      </div>

      <figcaption class="text-container">
        <p class="text-post">{{ post.message }}</p>
      </figcaption>

      <!-- Affichage du bouton like et commentaires, et de leurs compteurs -->
      <article class="iconsCounters">
        <div class="iconsCountersDiv">
          <button type="button" title="Liker" @click="likePost(post.id)">
            <HeartIcon :class="postLiked" />
          </button>
          <p class="smallText">
            {{ post.Likes.length }}
          </p>
        </div>
        <div class="iconsCountersDiv">
          <button
            type="button"
            title="Accéder aux commentaires"
            @click="showComments = !showComments"
          >
            <AnnotationIcon class="annotationIcon" />
          </button>
          <p class="smallText">
            {{ post.Comments.length }}
          </p>
        </div>
      </article>

      <!-- Section commentaires -->
      <section class="commentSection" v-show="showComments">
        <form>
          <div class="commentDiv">
            <textarea
              v-model="data.comment"
              class="commentTextArea"
              type="text"
              rows="1"
              placeholder="Votre commentaire"
              aria-label="Ecrire un commentaire"
            />
            <button
              type="button"
              title="Envoyer le commentaire "
              @click="commentPost(post.id)"
            >
              <ArrowCircleRightIcon
                class="commentArrow"
                :disabled="!validatedFields"
              />
            </button>
          </div>
        </form>
        <article class="commentList">
          <div
            v-for="comment of post.Comments"
            :key="comment.id"
            class="commentItem"
          >
            <img
              v-if="comment.User.picture !== null"
              class="commentImg"
              :src="comment.User.picture"
              alt="photo de profil"
            />
            <div class="commentBuble">
              <div class="topCommentBar">
                <p class="smallText-user">
                  {{ comment.User.username }}
                </p>
                <p class="smallText">
                  {{
                    moment(comment.createdAt).format(
                      "[le] DD MMMM YYYY [à] HH:mm"
                    )
                  }}
                </p>
                <div
                  v-if="
                    $store.state.user.userId == comment.UserId ||
                    $store.state.user.isAdmin == true
                  "
                  class=""
                >
                  <button
                    type="button"
                    title="Supprimer ce commentaire"
                    @click="deleteComment(comment.id)"
                  >
                    <TrashIcon class="commentIcons" />
                  </button>
                </div>
              </div>
              <p class="smallText">{{ comment.comment }}</p>
            </div>
          </div>
        </article>
      </section>
    </figure>
  </article>
</template>

<script>
import moment from "moment";
import modifyModal from "../components/PostModifyModal.vue";

import {
  PencilIcon,
  TrashIcon,
  HeartIcon,
  AnnotationIcon,
  ArrowCircleRightIcon,
} from "@heroicons/vue/solid";

export default {
  name: "Posts",

  components: {
    modifyModal,
    PencilIcon,
    TrashIcon,
    HeartIcon,
    AnnotationIcon,
    ArrowCircleRightIcon,
  },

  data: () => ({
    comment: "",

    showComments: false, // La div des commentaires ne s'affiche pas à la base

    showModal: false, // Ni la modale permettant de modifier un post

    data: {
      comment: "",
    },
  }),

  props: {
    // On récupére post du parent, donc de Wall.vue
    post: {
      type: Object,
    },
  },

  created: function () {
    this.moment = moment; // Permet le formatage de la date du post
    moment.locale("fr");
  },

  methods: {
    modifyPost(id) {
      (this.showModal = true), this.$router.push(`/posts/${id}`);
      this.$store.dispatch("getPostByID", id); // Récupération du contenu du post dès ouverture de la modale
    },

    closeModifyPost() {
      this.showModal = false;
      this.$router.push("/wall");
    },

    deletePost(id) {
      this.$store.dispatch("deleteOnePost", id);
    },

    likePost(id) {
      this.$store.dispatch("postLike", id);
    },

    commentPost(id) {
      this.$store.dispatch("addComment", {
        id: id,
        data: this.data,
      });
      this.data.comment = ""; // Supprime le commentaire du data après l'envoi, permet de fermer la div
    },

    deleteComment(id) {
      this.$store.dispatch("deleteOneComment", id);
    },
  },

  computed: {
    postLiked() {
      // Le bouton like reste en rose si l'user a déjà liké l'article
      const userId = this.$store.state.user.userId;
      let userLike = this.post.Likes.map((id) => id.UserId.toString()); // A convertir pour comparaison avec userId
      //console.log(typeof userId);
      //console.log(typeof userLike);
      if (userLike.includes(userId)) {
        return "h-6 w-6 mr-1 text-pink-600 ";
      } else {
        return "h-6 w-6 mr-1 text-gray-300 hover:text-pink-600";
      }
    },

    validatedFields: function () {
      if (this.data.comment != "") {
        return true;
      } else {
        return false;
      }
    },
  },
};
</script>

<style>
.post-main {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.post-display {
  width: 90%;
  padding: 20px;
  margin: 20px;
  display: flex;
  flex-direction: column;
  border-radius: 20px;
  box-shadow: 0px 1px 9px 2px rgb(0 0 0 / 46%);
}
.post-top {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
.post-username {
  font-size: 1.2rem;
  font-weight: bold;
  color: rgb(68, 68, 68);
}
.post-username:hover {
  border-bottom: 2px solid #4e5166;
}
.post-img {
  display: flex;
  align-items: center;
}
.post-creation-date {
  font-size: 0.8rem;
  color: rgb(68, 68, 68);
  align-self: center;
}
.postImg {
  margin: 10px;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid lightgray;
}

.pencilIcon {
  margin-right: 15px;
  height: 25px;
  width: 25px;
  fill: rgb(68, 68, 68);
}
.trashIcon {
  margin-left: 15px;
  height: 25px;
  width: 25px;
  fill: rgb(255, 0, 0);
}

.postImg-container {
  display: flex;
  justify-content: center;
  max-height: 300px;
  padding-bottom: 5px;
}
.post-big-img {
  object-fit: cover;
  border-radius: 10px;
}

.text-post {
  font-size: 1.2rem;
  color: rgb(68, 68, 68);
  padding: 20px;
  border: 1px solid rgba(201, 201, 201, 0.568);
  border-radius: 20px;
}

.smallText {
  font-size: 0.8rem;
  color: black;
}
.text-container {
  margin: 30px 0px;
}

/* ICONS COUNTER */

.iconsCounters {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.iconsCountersDiv {
  display: flex;
  width: 50px;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;
}
.annotationIcon {
  height: 25px;
  width: 25px;
  fill: rgb(117, 117, 117);
}

/* COMMENT SECTION */
.commentSection {
  display: flex;
  flex-direction: column;
  width: 100%;
  border: 1px solid lightgray;
  border-radius: 20px;
  box-shadow: 9px 2px 11px 5px rgba(0, 0, 0, 0.123);
  background-color: rgb(226, 226, 226);
  padding: 20px;
}

.commentIcons {
  height: 15px;
  width: 15px;
  fill: red;
}
.commentDiv {
  display: flex;
  align-items: center;
  justify-content: center;
}
.commentTextArea {
  width: 100%;
  height: 50px;
  border: 1px solid lightgray;
  border-radius: 20px;
  padding: 5px;
  resize: none;
}
.commentArrow {
  height: 25px;
  width: 25px;
  fill: rgb(151, 151, 151);
}
.commentArrow:hover {
  fill: rgb(80, 79, 79);
}
.smallText-user {
  font-size: 1rem;
  margin-right: 5px;
  color: rgb(63, 62, 62);
  font-weight: bold;
}
.commentList {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  margin-left: 30px;
  width: 100%;
}
.commentItem {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  margin-bottom: 10px;
  margin-top: 10px;
}
.commentImg {
  height: 50px;
  width: 50px;
  border-radius: 50%;
  margin: 10px;
  object-fit: cover;
  border: 1px solid lightgray;
}
.commentBuble {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  margin-left: 30px;
  padding: 10px;
  border-radius: 20px;
  width: 100%;
  background-color: rgba(255, 255, 255, 0.897);
}
.topCommentBar {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
}

/* MEDIA QUERIES */

@media screen and (max-width: 768px) {
  .post-display {
    width: 100%;
    padding: 10px;
    margin: 10px 0px;
    border-bottom: 2px solid #4e5166;
    border-top: 2px solid #4e5166;
    box-shadow: none;
    border-radius: 0px;
  }

  .commentList {
    margin-left: 0px;
    width: 100%;
  }

  .commentItem {
    flex-direction: column;
    margin: 0px;
  }
  .commentBuble {
    margin-left: 0px;
    width: 100%;
  }
  .smallText {
    word-break: break-word;
  }
}
</style>
