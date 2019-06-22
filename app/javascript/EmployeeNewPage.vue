<template>
  <recipe-form-pane :errors="errors" :recipe="recipe" @submit="createRecipe"></recipe-form-pane>
</template>

<script>
import axios from 'axios';

import RecipeFormPane from 'RecipeFormPane.vue';

export default {
  components: {
    RecipeFormPane
  },
  data() {
    return {
      recipe: {
        title: '',
        video_url: '',
        thumbnail_url: '',
        servings: '',
        salt: '',
        calorie: '',
        introduction: '',
        boosted: ''
      },
      errors: ''
    }
  },
  methods: {
    createRecipe: function() {
      axios
        .post('/api/v1/recipes', this.recipe)
        // .then(response => {
        //   let e = response.data;
        //   this.$router.push({ name: 'RecipeDetailPage', params: { id: e.id } });
        // })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>
