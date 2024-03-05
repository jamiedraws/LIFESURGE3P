"use strict";

// let's set up Service Worker name
const sw = "Life Surge";

// let's set up our cache name (cn)
const cname = "rev-4";

// let's set up our query string
const qs = "search" in location ? location.search : "";

// on install, let's cache some resources
addEventListener("install", function (event) {
    console.log(sw + ": Installing");

    /**
     * First, open the cache and use `addAll()` with an array of assets to add all of them to the cache.
     * Ask the service worker to keep installing until the returning promise resolves.
     */
    event.waitUntil(
        caches
            .open(cname)
            .then(function (cache) {
                // then, let's cache the critical resources
                return cache.addAll([
                    "https://use.typekit.net/af/e7065f/00000000000000007735ba3f/30/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3",
                    "https://use.typekit.net/af/370ed2/00000000000000007735ba41/30/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3",
                    "/css/default/shell.css?v=4",
                    "/images/logo.png"
                ]);
            })
            .then(function () {
                if (typeof skipWaiting === "function") {
                    skipWaiting();
                }
            })
    );
});

// then, let's activate our service worker
addEventListener("activate", function (event) {
    console.log(sw + ": Activating");

    // let's remove unwanted caches
    event.waitUntil(
        caches.keys().then(function (cnames) {
            return Promise.all(
                cnames.map(function (cache) {
                    if (cache !== cname) {
                        console.log(sw + ": Clearing Old Cache");
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
});

// on fetch, let's use the cache but update the entry with the latest contents from the network.
addEventListener("fetch", function (event) {
    console.log(sw + ": Fetching");

    // for all other requests, use cache-first then network strategy
    event.respondWith(
        caches.match(event.request).then(function (r) {
            return r || fetch(event.request);
        })
    );
});
