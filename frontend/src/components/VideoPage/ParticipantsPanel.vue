<script setup>

</script>

<template>
  <div class="participants_panel">
    <!-- The count will be dynamic -->
    <p class="panel_title">Meeting Participants (30)</p>
    <div class="search_input">
      <input type="text" placeholder="Search Participant">
    </div>
    <hr>
  </div>
</template>

<style scoped>
    .participants_panel {
        background: #ffffff;
        margin-left: 1rem;
        width: 30%;
        border-radius: 0.5rem;
        padding: 1rem;
    }

    .panel_title {
        margin-bottom: 0.5rem;
    }

    .search_input {
        display: flex;
        justify-content: center;
    }

    .search_input input {
        background: #F5F5F5;
        padding: 0.5rem;
        border: none;
        border-radius: 0.5rem;
        font-size: 0.9rem;
    }

    .search_input input:focus {
        outline: none;
        border-color: #007bff;
    }

</style>