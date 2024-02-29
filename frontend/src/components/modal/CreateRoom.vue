<template>
    <form class="modal-form create-form" @submit.prevent="submitCreateForm">
        <input class="form-input" type="text" v-model="UserName" placeholder="Enter UserName">
        <input class="form-submit create-room-btn" type="submit" value="Create">
    </form>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const UserName = ref('');
const router = useRouter();

const submitCreateForm = async () => {
    if(UserName.value === '')return;
    const client = await axios.post('http://localhost:3000/api/v1/vonage_room', { 'user': UserName.value })
    router.push({ 
        path: '/call',
        query: {
            'clientSessionId': client.data.clientSessionId,
            'clientToken': client.data.clientToken
        }
      });
}

</script>

<style scoped>
.modal-form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.form-input {
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #DDDDDD;
  color: #A0A6A3;
  font-family: "Roboto Mono", sans-serif;
  box-shadow: 1px 5px 9px rgba(211, 211, 211, .7);
}

.create-room-btn {
  margin-top: 10px;
  padding: 10px 20px;
  border-radius: 5px;
  border: none;
  background-color: #003A74;
  color: white;
  cursor: pointer;
  box-shadow: 1px 5px 9px rgba(211, 211, 211, .9);
}
</style>
