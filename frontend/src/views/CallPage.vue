<script setup>
import { useSessionStore } from '../stores/sessionStore'
import { useRouter } from 'vue-router';
import VideoPage from '@/components/VideoPage.vue';
import VideoCall from '@/components/helper/VideoCall.vue'
import axios from 'axios'
const router = useRouter();
const OT = window.OT;

const appId = import.meta.env.VITE_APP_ID;
const appAddress = import.meta.env.VITE_APP_ADDRESS;

const sessionStore = useSessionStore();
const { meetingId } = router.currentRoute.value.query;
const response = await axios.get(`${appAddress}/api/v1/join_room`, {
      params: {
        meeting_id: meetingId
      }
    });

const {clientSessionId, clientToken} = response.data    
const createSession = async (appId, sessionId) => {
   if (OT.checkSystemRequirements() == 1) {
      const sessionObj = await OT.initSession(appId, sessionId);
      sessionStore.setSession(sessionObj);
   } else {
      console.log('Something is not working properly in your browser');
   }
}

await createSession(appId, clientSessionId);
sessionStore.setToken(clientToken);

</script>

<template>
      <VideoPage/>
      <VideoCall/>
</template>

<style scoped></style>

