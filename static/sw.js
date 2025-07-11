self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open('salas-app-cache').then(function(cache) {
      return cache.addAll([
        '/',
        '/api/rooms/',
        '/api/bookings/',
        '/static/css/style.css',
        '/static/js/app.js'
      ]);
    })
  );
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request);
    })
  );
});