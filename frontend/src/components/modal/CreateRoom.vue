<script setup>
import { ref } from 'vue'
import axios from 'axios'
const UserName = ref('');

const submitCreateForm = async () => {
    const client = await axios.post('http://localhost:3000/api/v1/vonage_room',{'user': UserName})
    console.log(client.data);
}
</script>

<template>
   <form class="modal-form create-form" @submit.prevent="submitCreateForm">
    <input class="form-input" type="text" v-model="UserName" placeholder="Enter UserName">
    <input class="form-submit" type="submit" value="Create" >
   </form>
</template>

<style scoped>

</style>