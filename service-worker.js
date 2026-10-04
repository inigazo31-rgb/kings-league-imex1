const CACHE_NAME = "kings-imex-shell-v1";
const APP_SHELL = [
  "./",
  "./index.html",
  "./manifest.webmanifest",
  "./assets/icons/kings-imex.svg",
  "./assets/icons/pwa-192.png",
  "./assets/icons/pwa-512.png",
  "./assets/icons/apple-touch-icon.png",
  "./css/variables.css",
  "./css/layout.css",
  "./css/components.css",
  "./css/cards.css",
  "./css/views.css",
  "./css/responsive.css",
  "./js/app.js",
];

self.addEventListener("install", (event) => {
  event.waitUntil(caches.open(CACHE_NAME).then((cache) => cache.addAll(APP_SHELL)).then(() => self.skipWaiting()));
});

self.addEventListener("activate", (event) => {
  event.waitUntil(caches.keys().then((keys) => Promise.all(keys.filter((key) => key.startsWith("kings-imex-") && key !== CACHE_NAME).map((key) => caches.delete(key)))).then(() => self.clients.claim()));
});

self.addEventListener("fetch", (event) => {
  const request = event.request;
  const url = new URL(request.url);
  if (request.method !== "GET" || url.origin !== self.location.origin || url.pathname.includes("/api/")) return;

  event.respondWith((async () => {
    const isNavigation = request.mode === "navigate";
    try {
      const response = await fetch(request);
      if (response.ok && response.type === "basic") {
        const cache = await caches.open(CACHE_NAME);
        cache.put(isNavigation ? "./index.html" : request, response.clone());
      }
      return response;
    } catch {
      const cache = await caches.open(CACHE_NAME);
      return await cache.match(request) || (isNavigation ? cache.match("./index.html") : undefined) || Response.error();
    }
  })());
});
