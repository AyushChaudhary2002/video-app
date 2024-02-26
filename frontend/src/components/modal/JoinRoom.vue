<script setup>
import { ref } from 'vue'
const UserName = ref('');
const SessionId = ref('');

const submitJoinForm = () => {
    
}
</script>

<template>
    <form class="modal-form join-form" @submit.prevent="submitJoinForm">
        <input class="form-input" type="text" v-model="UserName" placeholder="Enter UserName">
        <input class="form-input" type="text"  v-model="SessionId" placeholder="Enter SessionId">
        <input class="form-submit" type="submit" value="Join">
    </form>
</template>

<style scoped></style>