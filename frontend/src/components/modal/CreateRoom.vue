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
    // joinSession(appId, client.data.clientSessionId, client.data.clientToken);
    
}

</script>

<template>
    <form class="modal-form create-form" @submit.prevent="submitCreateForm">
        <input class="form-input" type="text" v-model="UserName" placeholder="Enter UserName">
        <input class="form-submit" type="submit" value="Create">
    </form>
</template>

<style scoped></style>