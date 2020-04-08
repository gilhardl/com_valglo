'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "f1ea8fb01069e891e01c0f25209be11a",
"/main.dart.js": "12e8ba7fec256ca6bb7a2bb53522a333",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "387e9a1ad6d934c24c795cdd75a7a135",
"/assets/LICENSE": "8b77b6a88a1cec50f65d16a42321eb94",
"/assets/images/parc_jouvet.png": "a18b10b03093747608b962f157aa649f",
"/assets/images/sarah.png": "98efc9c4b032420fe6eb275f443ee647",
"/assets/images/leo.png": "0a354467d9186ac967e4bda41bb01825",
"/assets/images/elise.png": "57dc6b203768798c6c1e3b02eaa7d485",
"/assets/images/baptiste.png": "a5e9f3df41982f602046916130fbd693",
"/assets/images/logo.png": "61a189703dc7d6f3c5f8a1867cf7b11f",
"/assets/images/oriane.png": "f3de57d465280ea087b15b0fdc680ec6",
"/assets/AssetManifest.json": "c814e4734cc5920b99862ddee50d768d",
"/assets/FontManifest.json": "5fa2baa1355ee1ffd882bec6ab6780c7",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
