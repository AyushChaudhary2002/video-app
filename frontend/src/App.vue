<script setup>
import { RouterLink, RouterView } from 'vue-router'
import SideNav from './components/SideNav.vue';
import VideoPanel from './components/VideoPanel.vue';
import ParticipantsPanel from './components/ParticipantsPanel.vue';
</script>

<template>
    <div class="wrapper">
      <SideNav/>
      <VideoPanel/>
      <ParticipantsPanel/>
    </div>
</template>

<style scoped>
  .wrapper {
    display: flex;
    height: 100vh;
  }
</style>
