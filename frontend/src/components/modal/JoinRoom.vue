<template>
  <form class="modal-form join-form" @submit.prevent="submitJoinForm">
    <input class="form-input" name="meeting_id" type="text" v-model="meetingId" placeholder="Enter Meeting Id">
    <input class="form-submit join-room-btn" type="submit" value="Join">
  </form>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter();

const meetingId = ref('');

const submitJoinForm = async () => {
  router.push({ 
        path: '/pretest',
        query: {
            'meetingId': meetingId.value,
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
