<script setup>
import { useSessionStore } from '../stores/sessionStore'
import { useRouter } from 'vue-router';
import VideoPage from '@/components/VideoPage.vue';
import VideoCall from '@/components/helper/VideoCall.vue'
const router = useRouter();
const OT = window.OT;

const appId = import.meta.env.VITE_APP_ID;

const sessionStore = useSessionStore();
const { clientSessionId, clientToken } = router.currentRoute.value.query;

const createSession = async (appId, sessionId) => {
   if (OT.checkSystemRequirements() == 1) {
      const sessionObj = await OT.initSession(appId, sessionId);
      sessionStore.setSession(sessionObj);
   } else {
      console.log('Something is not working properly in your browser');
   }
}

await createSession(appId, clientSessionId);

console.log(clientToken);
sessionStore.setToken(clientToken);

</script>

<template>
      <VideoPage/>
      <VideoCall/>
</template>

<style scoped></style>

