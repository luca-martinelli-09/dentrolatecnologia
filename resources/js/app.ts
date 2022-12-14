/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import { createApp } from "vue";
import router from "./router";
import App from "./layouts/App.vue";

const app = createApp(App);

app.use(router);
app.mount("#app");
