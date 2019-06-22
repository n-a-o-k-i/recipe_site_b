<template>
  <div>
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>title</th>
          <!-- <th>actions</th> -->
        </tr>
        <tr v-for="r in recipes" :key="r.id">
          <td>{{ r.id }}<!-- <router-link :to="{ name: 'RecipesDetailPage', params: { id: e.id } }">{{ e.id }}</router-link> --></td>
          <td>{{ r.title }}</td>
          <!-- <td>
            <router-link :to="{ name: 'RecipesEditPage', params: { id: e.id } }">Edit</router-link>
            <button @click="deleteTarget = e.id; showModal = true">Delete</button>
          </td> -->
        </tr>
      </tbody>
    </table>
    <!-- <router-link :to="{ name: 'RecipesNewPage' }">New</router-link>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteRecipes(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal> -->
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  data: function () {
    return {
      recipes: [],
      errors: ''
    }
  },
  mounted () {
    this.updateRecipes();
  },
  methods: {
    // deleteRecipes: function() {
    //   if (this.deleteTarget <= 0) {
    //     console.warn('deleteTarget should be grater than zero.');
    //     return;
    //   }

    //   axios
    //     .delete(`/api/v1/recipes/${this.deleteTarget}`)
    //     .then(response => {
    //       this.deleteTarget = -1;
    //       this.updateRecipes();
    //     })
    //     .catch(error => {
    //       console.error(error);
    //       if (error.response.data && error.response.data.errors) {
    //         this.errors = error.response.data.errors;
    //       }
    //     });
    // },
    updateRecipes: function() {
      axios
        .get('//localhost:3000/api/v1/recipes')
        .then(res => {
        var recipes = [];

        for (var i = 0; i < res.data.data.length; i++) { 
          recipes.push(res.data.data[i]);
        }

        this.recipes = recipes;
      });
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
