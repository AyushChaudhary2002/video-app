import { defineStore } from 'pinia'
import { ref, reactive } from 'vue'

export const useSessionStore = defineStore('sessionStore', {
    state: () => ({
        session: reactive(),
        token: ref(null),
    }),
    actions: {
        setToken(clientToken) {
            this.token = clientToken;
        },
        setSession(session) {
            this.session = session;
        }
    }
})