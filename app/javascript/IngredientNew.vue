<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Recipe-ID</label>
      <input v-model="ingredient.recipe_id">
    </div>
    <div>
      <label>Sort-Order</label>
      <input v-model="ingredient.sort_order">
    </div>
    <div>
      <label>Name</label>
      <input v-model="ingredient.name">
    </div>
    <div>
      <label>quantity_and_unit</label>
      <input v-model="ingredient.quantity_and_unit">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
import axios from 'axios';

// export default {
//   data() {
//     return {
//       ingredient: {
//         recipe_id: '',
//         sort_order: '',
//         name: '',
//         quantity_and_unit: ''
//       },
//       errors: ''
//     }
//   },
//   methods: {
//     createingredient: function() {
//       axios
//         .post('/api/v1/ingredients', this.ingredient)
//         // .then(response => {
//         //   let e = response.data;
//         //   this.$router.push({ name: 'ingredientDetailPage', params: { id: e.id } });
//         // })
//         .catch(error => {
//           console.error(error);
//           if (error.response.data && error.response.data.errors) {
//             this.errors = error.response.data.errors;
//           }
//         });
//     }
//   }
// }
export default {
  props: {
    ingredient: {},
    errors: ''
  }
}
</script>

<style scoped>
</style>
