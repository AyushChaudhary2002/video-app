<script setup>
import { ref } from 'vue'
import JoinRoom from '../components/modal/JoinRoom.vue'
import CreateRoom from '../components/modal/CreateRoom.vue'
const joinShow = ref(false)
</script>

<template>
    <div class="home-area">
        <nav class="nav-bar">
            <button class="join-room-btn" @click="joinShow = true">Join</button>
            <button class="create-room-btn" @click="joinShow = false">Create</button>
        </nav>
        <div class="modal-area">
            <p class="modal-type" v-if="joinShow">Join Room</p>
            <p class="modal-type" v-else>Create Room</p>
            <JoinRoom v-if="joinShow" />
            <CreateRoom v-else />
        </div>
    </div>
</template>

<style scoped></style>
