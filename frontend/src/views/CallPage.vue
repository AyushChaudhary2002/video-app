<script setup>
import { useRouter } from 'vue-router';
import { onMounted } from 'vue';
import VideoPage from '@/components/VideoPage.vue';
import VideoCall from '@/components/helper/VideoCall.vue'
const router = useRouter();
const OT = window.OT;
import { ref } from 'vue';

const session = ref(null);
const clientToken = ref(null);
const appId = 'a867c7c6-83f9-41be-b754-a0d0ff42aaae';

const { clientSessionId, clientTokenValue } = router.currentRoute.value.query;

const createSession = async (appId, sessionId) => {
   if (OT.checkSystemRequirements() == 1) {
      const sessionObj = await OT.initSession(appId, sessionId);
      session.value = sessionObj;
   } else {
      console.log('Something is not working properly in your browser');
   }
}

onMounted( ()=> {
   createSession(appId, clientSessionId);
})

clientToken.value = clientTokenValue;
</script>

<template>
      <VideoPage/>
      <VideoCall :session="session" :clientToken="clientToken" />
</template>

<style scoped></style>

