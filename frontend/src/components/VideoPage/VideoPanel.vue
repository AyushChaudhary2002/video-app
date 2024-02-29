<script setup>
    const toggleMute = ()=>{}
    const toggleVideo = ()=>{}
    const endCall = ()=>{}
</script>

<template>
  <div class="video_panel" >
    <p>Live Video Chat Feed</p>

    <div class="video_feed" id="publisher">
    </div>
    <div class="controls">
      <button @click="toggleMute" class="control_button"><i class="fas fa-microphone"></i></button>
      <button @click="endCall" class="control_button end_call"><i class="fas fa-phone-slash"></i></button>
      <button @click="toggleVideo" class="control_button"><i class="fas fa-video"></i></button>
    </div>
  </div>
</template>

<style scoped>
    .video_panel {
        background: #ffffff;
        margin-left: 1rem;
        width: 50%;
        border-radius: 0.5rem;
        padding: 1rem;
    }
    .video_feed {
        background: yellow;
        border-radius: 0.5rem;
        min-width: 100%;
        min-height: 75%;
    }
    .controls {
        margin-top: 1rem;
        display: flex;
        justify-content: center;
    }   
    .control_button {
        background: #484848;
        border: none;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 10px;
        cursor: pointer;
        color: #ffffff;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }
    .control_button:hover {
        background: #B0B0B0;
        border-color: #bbb;
    }
    .end_call {
        background: red;
    }
</style>