<script setup>
</script>

<template>
 <div class="chart-area">
  <div class="audio-chart"></div>
  <div class="video-chart"></div>
 </div>
</template>

<style scoped>
  .chart-area {
    border: 4px solid yellow;
    width: 45vw;
    height:60vh;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }
  .audio-chart, .video-chart{
    border: 4px solid red;
  }

</style>
