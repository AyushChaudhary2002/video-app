<script setup>
</script>

<template>
  <div class="participants_panel">
    <!-- The count will be dynamic -->
    <p class="panel_title">Meeting Participants (30)</p>
    <hr>
    <div class="participants_area" id="js-participants">
      <!-- <div class="subscriber_feed" id="js-subscriber1"></div>
      <div class="subscriber_feed" id="js-subscriber2"></div>
      <div class="subscriber_feed" id="js-subscriber3"></div> -->
    </div>
  </div>
</template>

<style scoped>
.participants_panel {
  background: #ffffff;
  margin-left: 1rem;
  width: 35%;
  border-radius: 0.5rem;
  padding: 1rem;
}


.participants_area {
  display: grid;
  grid-template-columns: 1fr 1fr;
  height: 90%;
  overflow: scroll;
  overflow-x: hidden;
}

.panel_title {
  margin-bottom: 0.5rem;
}

</style>