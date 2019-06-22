<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Title</label>
      <input v-model="recipe.title">
    </div>
    <div>
      <label>Video-URL</label>
      <input v-model="recipe.video_url">
    </div>
    <div>
      <label>Thumbnail-URL</label>
      <input v-model="recipe.thumbnail">
    </div>
    <div>
      <label>Servings</label>
      <input v-model="recipe.servings">
    </div>
    <div>
      <label>Salt</label>
      <input v-model="recipe.salt">
    </div>
    <div>
      <label>Calorie</label>
      <input v-model="recipe.calorie">
    </div>
    <div>
      <label>Intro</label>
      <input v-model="recipe.introduction">
    </div>
    <div>
      <label>Boosted?</label>
      <input v-model="recipe.boosted">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
export default {
  props: {
    recipe: {},
    errors: ''
  }
}
</script>

<style>
</style>
