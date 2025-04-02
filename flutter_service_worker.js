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
"assets/NOTICES": "04416d95e15a27d281dda18a00a00aec",
"assets/assets/projeto/indisponivel.webp": "925d3cf63b49307f3036b7071b5eb932",
"assets/assets/projeto/deltacomerce.webp": "453a78ff88bbf6cc9c981d24ac8d1a9c",
"assets/assets/tecno/python.webp": "8cbc88944165bb695e9f354ab72ac0bc",
"assets/assets/tecno/js.webp": "bee48421858cf6f39e18e4cb94144723",
"assets/assets/tecno/github.webp": "f89f962836faba8bc61c420c4f0a299c",
"assets/assets/tecno/ts.webp": "e5d752966d5c9e9d1f5ca6d3c76192af",
"assets/assets/tecno/kotlin.webp": "1a7c365318af85e93f8a8ee41270ac0d",
"assets/assets/tecno/postg.webp": "3b1ba195f5760bab602a380ad039131e",
"assets/assets/tecno/firebase.webp": "a82dc9ccc390b4bb9897aa3c06e0def4",
"assets/assets/tecno/email.webp": "32f728aeed33ce4e9bb01013b36402a0",
"assets/assets/tecno/react.webp": "87fc96b4a7da3948f41aac9c38091eb4",
"assets/assets/tecno/flutter.webp": "7e51f88be8a76e29f59760146cf797ff",
"assets/assets/tecno/mongo.webp": "32781a37eeed5f71ba4a7ae0547f46b9",
"assets/assets/tecno/linkedin.webp": "5a2bc4ba0beabfb3186ad188da58a30f",
"assets/assets/tecno/insta.webp": "b9f1daa61185412168767be7c08f9354",
"assets/assets/images/logo_lula.webp": "bed2cf72f6c4e67e9d856f91a2ed53d0",
"assets/assets/images/barcolor.webp": "c968783309648bb4e46ac5800f26df88",
"assets/assets/images/perfil_port.webp": "8ba2da8066a61f260e3de357a2b10c8c",
"assets/assets/fonts/JockeyOne-Regular.ttf": "d4c58485a8aa01b0040ff3c940043dbf",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f028e1c40d27a57a668a75edc1cdf6a4",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/FontManifest.json": "0abdd28794ccacb8e013326d16fb555c",
"assets/AssetManifest.bin.json": "11a1615cb6b8853470acf07a5b5b1914",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "72e6afb3562c6870d1b490b65de038f1",
"version.json": "061068e2c9bf138d06622981ae841092",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.svg": "6818ba265e18b8631119d5014f6f32c5",
"main.dart.js": "5726ab880f03970b36901bc1f247250d",
"icons/Icon-maskable-512.png": "439cbf4736cc8bfecc6e22e481ed0060",
"icons/Icon-192.png": "a986d198fb58bcdc4948300a770f0922",
"icons/Icon-512.png": "439cbf4736cc8bfecc6e22e481ed0060",
"icons/Icon-maskable-192.png": "a986d198fb58bcdc4948300a770f0922",
"manifest.json": "1c96975bb7abb9b01cea9b72b3fd1bbf",
"favicon.png": "98b7262951ae073c6df43e36f5b4378c",
"flutter_bootstrap.js": "9bd49e31b6c8e62ea38564ce50e5a6a1"};
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
