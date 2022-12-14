<script setup lang="ts">
</script>

<template>
  <div>
    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
      <router-link :to="{ name: 'home' }" class="navbar-brand">Laravel-Vue SPA</router-link>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <audio src="https://www.dentrolatecnologia.it/files/audio/s4e50.mp3" controls></audio>
      <div id="navbarCollapse" class="navbar-collapse">
        <ul class="navbar-nav">
          <li class="nav-item">
            <router-link class="nav-link" data-toggle="collapse" :to="{ name: 'home' }">
              Home
            </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" data-toggle="collapse" :to="{ name: 'about' }">
              About
            </router-link>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container">
      <router-view></router-view>
    </div>
  </div>
</template>