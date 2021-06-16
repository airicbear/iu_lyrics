'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "1803b9358d86265070dc37c05086e003",
"splash/img/light-2x.png": "ce446bed179a5653b5ec66979e438612",
"splash/img/light-3x.png": "6ac6ae0366491ab14c6253c86ba443ba",
"splash/img/dark-3x.png": "6ac6ae0366491ab14c6253c86ba443ba",
"splash/img/dark-2x.png": "ce446bed179a5653b5ec66979e438612",
"splash/img/dark-1x.png": "5446b1b8d2806bdd76278b489adcf5ba",
"splash/img/light-1x.png": "5446b1b8d2806bdd76278b489adcf5ba",
"splash/style.css": "a5af5b5d5486da468ebefae1df757c6f",
"index.html": "134ebf348a3bd808e1cb5f74d7c07f2d",
"/": "134ebf348a3bd808e1cb5f74d7c07f2d",
"main.dart.js": "e1f4b22c25838967c3754dbe86229e98",
"favicon.png": "25e5f75ab8cb2b0a6129198e42721bd7",
"icons/Icon-192.png": "4a73d25a144f579eaba637bb9021337c",
"icons/Icon-512.png": "640208cd7aef5daf6d3fb1abaaf927bb",
"manifest.json": "cb33b8039439d9a27c38ff5ff0208f83",
"assets/AssetManifest.json": "9aed6ea23a9743d7ba628327007dfc96",
"assets/NOTICES": "3b90ac1b252a5c8f37ba1d085865df47",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/launcher.png": "640208cd7aef5daf6d3fb1abaaf927bb",
"assets/assets/banner.svg": "b5edb2e04225f9321a7f775e9495bcc3",
"assets/assets/iu.json": "0589889b623238b97a0810a2aff2aece",
"assets/assets/launcher.svg": "489ce7e0fb6de5b36537423cfe9ce0e9",
"assets/assets/cover_art/nagging_128.jpg": "317c2debcaad94a0301662aa0541dead",
"assets/assets/cover_art/bbibbi_128.jpg": "b0e91f7962c2571d60be4ca6f150e51e",
"assets/assets/cover_art/eight_128.jpg": "961fbd606e4ee5ee8a11cc42a93fe132",
"assets/assets/cover_art/spring_of_a_twenty_year_old_128.jpg": "514d41daa8e960fda7898fe6ff5dc149",
"assets/assets/cover_art/real_128.jpg": "f4fb339755527d41cb3bbd3a09b84cbd",
"assets/assets/cover_art/a_flower_bookmark_128.jpg": "1d336fe20b4087b86a442be2d1d9097d",
"assets/assets/cover_art/modern_times_epilogue_128.jpg": "4cccd9d49c18646a114d6ce09254d38b",
"assets/assets/cover_art/a_flower_bookmark_2_128.jpg": "088b4cbcaa0f4ae9a8e6afb4450694a1",
"assets/assets/cover_art/chat_shire_128.jpg": "530c0dd75a0f3f977e4b2fd34414a4a1",
"assets/assets/cover_art/palette_128.jpg": "ceaf36ac44efaaca001a5454b6379cc1",
"assets/assets/cover_art/iu_im_128.jpg": "0b130327469adea4bb160b98a40e86b2",
"assets/assets/cover_art/real_plus_128.jpg": "e6f77b20e6a2b5e2d0e55dc9e4f32179",
"assets/assets/cover_art/last_fantasy_128.jpg": "e2b0c9b09676cb3e1f8cbfc2c3e2f1fc",
"assets/assets/cover_art/lost_and_found_128.jpg": "b3ff5668c9ab6c3fcd136623c0ddcb30",
"assets/assets/cover_art/growing_up_128.jpg": "960601c33c401131738782b767b35af8",
"assets/assets/cover_art/love_poem_128.jpg": "fb19b0d9df32bceda8087da124be7de9",
"assets/assets/cover_art/soulmate_128.jpg": "99f7722cf4dcc477e1852e301b29a714",
"assets/assets/cover_art/modern_times_128.jpg": "f1afdbddf474779ab4e15232f8d37f67",
"assets/assets/cover_art/lilac_128.jpg": "47cd989bcbb31bc47819580d923003f3",
"assets/assets/splash.png": "30c60e44b6dc026454b6661df6abafe4",
"assets/assets/splash.svg": "061316ea3a4759e7e338ee09b0187eee"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
