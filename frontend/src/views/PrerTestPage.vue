<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import NetworkTest from 'opentok-network-test-js';
import ResultPretest from '@/components/pretest/ResultPretest.vue';
import ControllerCom from '@/components/pretest/ControllerCom.vue';
import VideoFeed from '@/components/pretest/VideoFeed.vue';
import axios from 'axios'
const router = useRouter();
const OT = window.OT;

const apiID = import.meta.env.VITE_APP_ID;

const { meetingId } = router.currentRoute.value.query;
const response = await axios.get('http://localhost:3000/api/v1/join_room', {
   params: {
      meeting_id: meetingId
   }
});

const { clientSessionId, clientToken } = response.data
console.log(response.data);
const otNetworkTest = new NetworkTest(OT, {
   apiKey: apiID, 
   sessionId: clientSessionId, 
   token: clientToken 
});

const resultData = ref(null);

console.log(otNetworkTest);

otNetworkTest.testConnectivity().then((results) => {
  console.log('OpenTok connectivity test results', results);
  otNetworkTest.testQuality(function updateCallback(stats) {
    console.log('intermediate testQuality stats', stats);
  }).then((results) => {
    // This function is called when the quality test is completed.
    console.log('OpenTok quality results', results);
    resultData.value = {
      audio : results.audio.supported,
      video : results.video.supported
    }
    let publisherSettings = {};
    if (results.video.reason) {
      console.log('Video not supported:', results.video.reason);
      publisherSettings.videoSource = null; // audio-only
    } else {
      publisherSettings.frameRate = results.video.recommendedFrameRate;
      publisherSettings.resolution = results.video.recommendedResolution;
    }
    if (!results.audio.supported) {
      console.log('Audio not supported:', results.audio.reason);
      publisherSettings.audioSource = null;
      // video-only, but you probably don't want this -- notify the user?
    }
    if (!publisherSettings.videoSource && !publisherSettings.audioSource) {
      // Do not publish. Notify the user.
    } else {
      // Publish to the "real" session, using the publisherSettings object.
    }
  }).catch((error) => {
    console.log('OpenTok quality test error', error);
  });
}).catch(function(error) {
  console.log('OpenTok connectivity test error', error);
});



</script>

<template>
  <div class="container">
    <div class="pretest-area">
      <VideoFeed/>
      <ControllerCom/>
    </div>
    <ResultPretest/>
  </div>
</template>

<style scoped>
 .pretest-area {
  display: flex;
  gap: 2rem;
  justify-content: center;
  margin-bottom: 2rem;
 }
 .container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
 }
</style>
