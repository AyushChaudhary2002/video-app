import { defineStore } from 'pinia';


export const useSessionStore = defineStore('sessionStore', {
    state: () => ({
        session: null,
        token: null,
        publisher: null,
    }),
    getters: {
        getSession() {
            return this.session;
        },
        getToken() {
            return this.token;
        },
        getPublisher() {
            return this.publisher;
        }
    },
    actions: {
        setToken(clientToken) {
            this.token =  clientToken;
        },
        setSession(session) {
            this.session = session;
        },
        setPublisher(publisher) {
            this.publisher = publisher;
        },
        setSessionProperty(key, value) {
            this.session[key] = value;
        }
    }
});
