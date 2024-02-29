<template>
    <form class="modal-form join-form" @submit.prevent="submitJoinForm">
        <input class="form-input" name="username" type="text" v-model="UserName" placeholder="Enter UserName">
        <input class="form-input" name="session_id" type="text" v-model="SessionId" placeholder="Enter SessionId">
        <input class="form-submit join-room-btn" type="submit" value="Join">
    </form>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const UserName = ref('');
const SessionId = ref('');

const submitJoinForm = async() => {
    try {
        const response = await axios.post('http://localhost:3000/api/v1/join_room', {
            session_id: SessionId.value,
            user_name: UserName.value
        });
        console.log(response);
    } catch(err) {
        console.log(err);
    }
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

.join-room-btn {
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
