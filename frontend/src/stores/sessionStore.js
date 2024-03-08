import { defineStore } from 'pinia';


export const useSessionStore = defineStore('sessionStore', {
    state: () => ({
        session: null,
        token: null,
        publisher: null,
        archiveId: null
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
        },
        getArchiveId() {
            return this.archiveId
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
        setArchiveId(archiveId) {
            this.archiveId = archiveId
        },
        setSessionProperty(key, value) {
            this.session[key] = value;
        }
    }
});
