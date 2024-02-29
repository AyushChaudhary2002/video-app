<script setup>
const OT = window.OT;
const { session, clientToken } = defineProps({
    session: {
        type: Object,
        required: true
    },
    clientToken: {
        type: String,
        required: true
    },

})

const publisherOptions = {
    'min-width': '100%',
    'min-height': '75%'

};

const publisher = OT.initPublisher('publisher', publisherOptions, (error) => {
    if (error) {
        console.log("Publishing issue: ", error.name, error.message);
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
connectSession(session, clientToken)
session.on('streamCreated', (event) => {
    const subscriberOptions = {
    };
    session.subscribe(event.stream, 'subscriber', subscriberOptions, (error) => {
        if (error)
            console.log("Subscribe issue: ", error.name, error.message);
        else
            console.log('subscriber add....');
    });
});


</script>

<template></template>

<style scoped></style>
