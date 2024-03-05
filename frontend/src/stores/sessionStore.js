import { defineStore } from 'pinia';


export const useSessionStore = defineStore('sessionStore', {
    state: () => ({
        session: null,
        token: null,
    }),
    getters: {
        getSession() {
            return this.session;
        },
        getToken() {
            return this.token;
        }
    },
    actions: {
        setToken(clientToken) {
            this.token =  clientToken;
        },
        setSession(session) {
            this.session = session;
        },
        setSessionProperty(key, value) {
            this.session[key] = value;
        }
    }
});
