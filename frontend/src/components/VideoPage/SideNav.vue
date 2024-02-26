<script setup>
defineProps({
  name: {
    type: String,
    required: true
  },
  profile_img: {
    type: String
  }
})
</script>

<template>
  <aside class="sidenav">
    <section class="user_details">
        <!-- <img :src="profile_img" alt="">
        <h3>{{ name }}</h3> -->
        <img class="user_profile_img" src="../assets/images/itachi.jpg" alt="">
        <h3 class="user_name">John Jacobs</h3>
    </section>
    <hr class="divider">

    <section class="nav_list_details">
        <ul class="nav_list">
          <li class="nav_list_item">
              <a class="nav_link" href="/">
                <i class="fas fa-users nav_link_icon"></i> Participants
              </a>
          </li>
          <li class="nav_list_item">
            <a class="nav_link" href="/">
                <i class="fas fa-comments nav_link_icon"></i> Chatting
            </a>
          </li>  
        </ul>
    </section>
</aside>
</template>

<style>
    .sidenav {
        /* width: calc(30% - 50px); */
        width: 20%;
        background-color: #ffffff;
        border-radius: 0.5rem;
        padding: 10px;
    }
    .user_details {
        display: flex;
        align-self: flex-start;
    }
    .user_profile_img {
        max-width: 3rem;
        max-height: 3rem;
        border-radius: 0.5rem;
    }
    .user_name {
        font-weight: normal;
        font-size: 1rem;
        margin-left: 0.5rem;
    }
    .divider {
        width: 100%;
        margin: 0.5rem 0;
    }
    .nav_list_details {
        margin-top: 2rem;
    }
    .nav_list {
        list-style-type: none;
        /* display: flex;
        flex-direction: column; */
        /* justify-content: start;
        align-items: flex-start; */
    }
    .nav_list_item {
        padding-bottom: 1rem; 
    }
    .nav_link {
        color: black;
        text-decoration: none;
        font-weight: 700;
        font-size: 1.05rem;
    }
    .nav_link_icon {
        color: #8dc6ff;
        padding-right: 0.5rem
    }
</style>