'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"index.html": "fe6049b04f8abe6508bbbff7bab80c5b",
"/": "fe6049b04f8abe6508bbbff7bab80c5b",
"assets/NOTICES": "098368d546985d36b8b5cab235ac94e8",
"assets/assets/projeto/deltacomerce.png": "bea0f07102e2b319d0c8f62240862186",
"assets/assets/projeto/indisponivel.png": "ec0767222ba786ed8185f0d1d7383da2",
"assets/assets/tecno/react.png": "1c0172c894ddba150e0b7ead89b65c55",
"assets/assets/tecno/ts.png": "95dc3ecfbb5e44aaa7f1643a3cf33438",
"assets/assets/tecno/mongo.png": "3525a9275e502d497be00a54d894cf17",
"assets/assets/tecno/kotlin.png": "aba651da381be186c561ad32618496f4",
"assets/assets/tecno/js.png": "84aac666125c5098d598092cc712cbe9",
"assets/assets/tecno/python.png": "eae51741df7a9a37fd8124ca2c141c7f",
"assets/assets/tecno/flutter.png": "6db2d284c99213675c0be4cd150fdd96",
"assets/assets/tecno/email.png": "c736bfaaf8014d2ec21780ee2ccc7eac",
"assets/assets/tecno/postg.png": "d222f6f2f0b1fc772c3856d3284a4c8a",
"assets/assets/tecno/linkedin.png": "83de2469b9009661a0d6071c90f9d914",
"assets/assets/tecno/firebase.png": "66de47968defc95b871d9b09be0a87d1",
"assets/assets/tecno/github.png": "0e5e1fc877c75f90c5b572f52708b060",
"assets/assets/images/logo_lula.png": "2cb3c62d0bdfbe18b7e1c1ca89a76c4a",
"assets/assets/images/fundo.jpg": "20d74547a65e677a0d637c9b502fff8a",
"assets/assets/images/perfil_port.png": "8ae6f39ddbb3f66b9b5e597413b8d7e1",
"assets/assets/images/barcolor.png": "965e1d743ab03d43827455c0d8c68261",
"assets/assets/images/logo_lula.svg": "6818ba265e18b8631119d5014f6f32c5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "86b48e4bf1d433d19f8fc3d76998da25",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "2943c0a3150049f364b126322e3b32cf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "bbacfa07f385faf291d443f3eabf52a9",
"version.json": "061068e2c9bf138d06622981ae841092",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.svg": "6818ba265e18b8631119d5014f6f32c5",
"main.dart.js": "5a72a42fc56aedda66da944860cf0b47",
"icons/Icon-maskable-512.png": "439cbf4736cc8bfecc6e22e481ed0060",
"icons/Icon-192.png": "a986d198fb58bcdc4948300a770f0922",
"icons/Icon-512.png": "439cbf4736cc8bfecc6e22e481ed0060",
"icons/Icon-maskable-192.png": "a986d198fb58bcdc4948300a770f0922",
"manifest.json": "1c96975bb7abb9b01cea9b72b3fd1bbf",
"favicon.png": "98b7262951ae073c6df43e36f5b4378c",
"flutter_bootstrap.js": "9842c37a9f68a98719c8e783f1c1dda8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
