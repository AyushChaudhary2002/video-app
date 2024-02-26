<script setup>
import SideNav from '../components/VideoPage/SideNav.vue';
import VideoPanel from '../components/VideoPage/VideoPanel.vue';
import ParticipantsPanel from '../components/VideoPage/ParticipantsPanel.vue';
</script>

<template>
  <header>
    <div class="wrapper">
      <SideNav/>
      <VideoPanel/>
      <ParticipantsPanel/>
    </div>
  </header>

</template>

<style scoped>
  .wrapper {
    display: flex;
    height: 100vh;
  }
</style>
