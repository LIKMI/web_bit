'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Light%2520Italic.otf": "2899ca5aadd7792b3d758fcddaa68d9d",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Regular%2520Italic.otf": "332696d7b54c6a3e3332df85b9711855",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Bold%2520Italic.otf": "f5762fd68f0d9a5ba10c11b6fd600d7b",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Thin.otf": "56b54001dd42f5fb8eba8af36465b364",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Semibold%2520Italic.otf": "387499c7b56330195fd234ec342afae3",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Regular.otf": "954a59c86a572f56aed19cb3e92aa65b",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Thin%2520Italic.otf": "3eddac2e0a401f4667cf0e8bce733c02",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Extrabold%2520Italic.otf": "92900b5992b5d42b76ebe30fc9674cf7",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Light.otf": "e2602b2f2c615d20c880911364b32191",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Black.otf": "db10f4e45e65eeaf47bb4acf02be560c",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Black%2520Italic.otf": "5838801da2222df9bab59d31ea93a267",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Extrabold.otf": "c122f679ed8544ea0d1211724221f036",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Bold.otf": "9d62cb9fcefe1cb94d2d90553cbef3f1",
"assets/assets/fonts/Proxima%2520Nova%2520Alt%2520Semibold.otf": "c3c03a5b7c2107a31c8e530164e68286",
"assets/assets/images/animals.jpg": "2e218a94e7842a946d772082ac8c5590",
"assets/assets/images/australia.jpg": "6170e8a703652c6b814dca7020050086",
"assets/assets/images/europe.jpg": "29a721b78efc7f928faf042c88806468",
"assets/assets/images/google_logo.png": "b75aecaf9e70a9b1760497e33bcd6db1",
"assets/assets/images/cover.jpg": "e1e4b2e46b8d6eabb7330afb0c0d30ff",
"assets/assets/images/north_america.jpg": "867d729d34a03bf38136bd45954ec218",
"assets/assets/images/favicon.png": "282bc56d5e217bf096a3b4a1ede5d553",
"assets/assets/images/1.jpg": "87393568811337f71c9a96844fbb2312",
"assets/assets/images/south_america.jpg": "1920c86e11a06921b339f00ff1d0ddea",
"assets/assets/images/m_nilai_semester_aktif_64px.png": "7c26d8b51e6f97f8c036b8f810c3aecc",
"assets/assets/images/trekking.jpg": "283eae13ae9587874b93fed5c9b4a118",
"assets/assets/images/africa.jpg": "27fc2c6667bd5bd7bba8117fafe28d86",
"assets/assets/images/asia.jpg": "bbcf97c1be29e77360e8407b7e2eaa05",
"assets/assets/images/antarctica.jpg": "71e86242fca831839833d1caa23f107e",
"assets/assets/images/photography.jpeg": "b0d14d6d4a94d33404a7df1344e7533b",
"assets/AssetManifest.json": "0c9bcddec029db12990792261a7d91f6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/FontManifest.json": "ae40529703ddcea6d9634a88eb4f7552",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "7eeab18244a34acd34590b518ce7bcc4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "959c83fbebb0e0b815395ad37c5617c9",
"index.html": "54c245eef360ef725d80de9ceb152e39",
"/": "54c245eef360ef725d80de9ceb152e39",
"CNAME": "788a521c18445a27352d27b487ba14ee",
"manifest.json": "dd0514930d5e8e3766eeb35c0282909b",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"version.json": "8eca040870b0a9628c46e70b9da2b299"
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
