<script setup>
    import { toRaw, ref } from 'vue'
    import { useSessionStore } from '@/stores/sessionStore';
    import { useRouter } from 'vue-router';
    import axios from 'axios';

    const sessionStore = useSessionStore();
    const appAddress = import.meta.env.VITE_APP_ADDRESS;
    const session = toRaw(sessionStore.getSession);
    const router = useRouter();
    const { meetingId } = router.currentRoute.value.query;

    const isToggleVideo = ref(true)
    const isToggleMic = ref(true)

    const toggleRecording = async () => {
        if(!sessionStore.getArchiveId){
            const response = await axios.post(`${appAddress}/api/v1/vonage_archive/start`, { 'meeting_id': meetingId})
            sessionStore.setArchiveId(response.data.archiveId)
        }else{
            const response = await axios.post(`${appAddress}/api/v1/vonage_archive/stop`, { 'archive_id': sessionStore.getArchiveId})
            sessionStore.setArchiveId(null)
        }
    }

    const toggleVideo = () => {
        const publisher = toRaw(sessionStore.getPublisher)
        isToggleVideo.value = !isToggleVideo.value
        publisher.publishVideo(isToggleVideo.value)
    }
    const toggleMic = () => {
        const publisher = toRaw(sessionStore.getPublisher)
        isToggleMic.value = !isToggleMic.value
        publisher.publishAudio(isToggleMic.value)
    }
    const endCall = () => {
        session.disconnect();
        router.push({path: "/"});
    }
</script>

<template>
    <div class="video_panel">
        <div class="video_feed" id="publisher"></div>
        <div class="controls">
            <button v-if="sessionStore.getArchiveId" @click="toggleRecording" class="control_button disconnect"><i
                    class="fas fa-circle-slash"></i></button>
            <button v-else @click="toggleRecording" class="control_button record_button"><i
                    class="fas fa-circle"></i></button>

            <button  v-if="isToggleMic" @click="toggleMic" class="control_button"><i class="fas fa-microphone"></i></button>
            <button  v-else @click="toggleMic" class="control_button disconnect"><i class="fas fa-microphone-slash"></i></button>

            <button @click="endCall" class="control_button end_call">
                <i class="fas fa-phone"></i>
            </button>

            <button v-if="isToggleVideo" @click="toggleVideo" class="control_button"><i class="fas fa-video"></i></button>
            <button v-else @click="toggleVideo" class="control_button disconnect"><i class="fas fa-video-slash"></i></button>
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
        border-radius: 0.5rem;
        min-width: 100%;
        min-height: 75%;
        cursor: pointer;
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
        transition:
            background-color 0.3s ease,
            border-color 0.3s ease;
    }

    .control_button:hover {
        background: #b0b0b0;
        border-color: #bbb;
    }

    .end_call, .disconnect {
        background: red;
    }
</style>
