<template>
    <div class="home-area">
        <div class="form-container">
            <nav class="nav-bar">
                <button :class="{ active: !joinShow }" class="create-room-btn" @click="joinShow = false">Create</button>
                <button :class="{ active: joinShow }" class="join-room-btn" @click="joinShow = true">Join</button>
            </nav>
            <div class="modal-area">
                <p v-if="!joinShow" class="modal-type">Create a room</p>
                <p v-else class="modal-type">Join a room</p>
                <JoinRoom v-if="joinShow" />
                <CreateRoom v-else />
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import JoinRoom from '../components/modal/JoinRoom.vue'
import CreateRoom from '../components/modal/CreateRoom.vue'
const joinShow = ref(false)
</script>

<style scoped>
.home-area {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-container {
  width: 400px;
  background-color: white;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.nav-bar {
  display: flex;
  justify-content: space-around;
  margin-bottom: 20px;
}

.nav-bar button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #f0f0f0;
  color: #666;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.nav-bar button:hover {
  background-color: #ddd;
  color: #333;
}

.nav-bar .active {
  background-color: #003A74;
  color: white;
}

.modal-area {
  margin-top: 20px;
}

.modal-area p {
  text-align: center;
  margin-bottom: 10px;
}

.modal-area input {
  width: calc(100% - 20px);
}
</style>
