<script setup>
import { useRouter } from 'vue-router';
import VideoPage from '@/components/VideoPage.vue';
import VideoCall from '@/components/helper/VideoCall.vue'
const router = useRouter();
const OT = window.OT;
import { ref } from 'vue';

let session ;
const token = ref(null);
const appId = import.meta.env.VITE_APP_ID;

const { clientSessionId, clientToken } = router.currentRoute.value.query;

const createSession = async (appId, sessionId) => {
   if (OT.checkSystemRequirements() == 1) {
      const sessionObj = await OT.initSession(appId, sessionId);
      console.log("session created");
      session = sessionObj;
   } else {
      console.log('Something is not working properly in your browser');
   }
}

await createSession(appId, clientSessionId);
console.log(session);

token.value = clientToken;
</script>

<template>
      <VideoPage/>
      <VideoCall :session="session" :clientToken="token" />
</template>

<style scoped></style>

