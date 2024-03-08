<script setup>
import { ref, toRaw } from 'vue';
import { useSessionStore } from '@/stores/sessionStore.js';
const OT = window.OT;
const sessionStore = useSessionStore()

const session = toRaw(sessionStore.getSession);
const clientToken = sessionStore.getToken


const publisherOptions = {
    'min-width': '100%',
    'min-height': '75%',
    nameDisplayMode: 'on'

};
const subscriberId = ref('');
const verifyMediaDevice = async () => {
    try {
        await OT.getUserMedia()
    } catch (error) {
        alert(error.originalMessage)
    }
}

await verifyMediaDevice()

const publisher = OT.initPublisher('publisher', publisherOptions, (error) => {
    if (error) {
        if(error.name === "OT_UNABLE_TO_CAPTURE_MEDIA") {
            alert('Cannot able to connect media device')
        }
        console.log("Publishing init issue: ", error.name, error.message);
    }
});


const connectSession = async (session, token) => {
    session.connect(token, (error) => {
        if (error) {
            console.log("Error connecting: ", error.name, error.message);
        } else {
            session.publish(publisher, (error) => {
                if (error)
                    console.log("Publishing issue: ", error.name, error.message);
            });
        }
    })
}
const count = ref(1);
connectSession(session, clientToken)

sessionStore.setPublisher(publisher)

session.on('streamCreated', (event) => {
    const subscriberOptions = {
        height: '10rem',
        width: '95%',
        nameDisplayMode: 'on'
    };
    subscriberId.value = `js-subscriber${count.value}`
    addSubscriberDiv()
    session.subscribe(event.stream, subscriberId.value, subscriberOptions, (error) => {
        if (error)
            console.log("Subscribe issue: ", error.name, error.message);
        else
            console.log('subscriber add....');
    });
    count.value += 1;
});

session.on("connectionDestroyed", () => {
    console.log('subscriber diconnect');
});

session.on('archiveStarted', (event) => {
    sessionStore.setArchiveId(event.id)
    console.log('ARCHIVE STARTED');
});

session.on('archiveStopped', () => {
    console.log('ARCHIVE STOPPED');
});

subscriberId.value
const addSubscriberDiv = () => {
    const targetElement = document.getElementById('js-participants');
    if (targetElement) {
        const divElement = document.createElement('div');
        divElement.setAttribute('class', 'subscriber_feed');
        divElement.setAttribute('id', subscriberId.value);
        targetElement.appendChild(divElement);
    }
}


</script>

<template></template>

<style scoped>

</style>
