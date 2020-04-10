'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "f1ea8fb01069e891e01c0f25209be11a",
"/": "f1ea8fb01069e891e01c0f25209be11a",
"main.dart.js": "b0afb68181597c110a440066eb3ee563",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "387e9a1ad6d934c24c795cdd75a7a135",
".git/config": "4007453a08af0c8cccb0e9c1e2863350",
".git/objects/61/e612ca3c9aab70345816d32f2d681d08715787": "e21300ebe064f5046b4466cfbe00ecd2",
".git/objects/95/19e1d75e8e60fc461d42dceff7162076484747": "87166efde232eca9c4f1ad4118b6d046",
".git/objects/32/a1afe9f97b540796be4946b088ccbe980af984": "75a7ae3bc5621f0bd33a97a36c0621df",
".git/objects/35/ad5ed508e4fe1d86501c79b7034f189f162508": "058574dfe5d34076fed14fa0b47739af",
".git/objects/67/0714186ea3b03fc5e381312a41f1fa8a9eaf17": "cacced32aca8cd9902391e8fdb6e65c8",
".git/objects/05/2f3f66d321e1a990995885d7993b24e4bbf198": "38573111fb1e8f95123676a553c3df70",
".git/objects/bb/7f240771122ce082b470528be19a81a269d768": "9e9dc6cea3c963b1dc2ba4a81722c131",
".git/objects/f4/b9b99d2d45e88805d2295cfcefce8658731041": "7fcdfb31b9e84d259e9c4fbfee892072",
".git/objects/f3/33a019eec2ece74c3e2f6d25c5e89c9f348f58": "71639eac278317e393f7cebce76ff104",
".git/objects/e3/80a60b286f35e70bb9ff7de78bd1d4b2611314": "928ea8bd2661b073052741c037f4182e",
".git/objects/c6/7268e27502f3aaa111e8e6fbbcd2044a6dba30": "fe67717888eedcef83f869df207fa584",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/27/48286572c68d0ccfeac5f8a4fc92d8392ea863": "59adf81b5d704c1cab4feeac4162a47a",
".git/objects/87/30975ba13a11d2e0e4498c273e4c88294c3804": "4658ae08d3aaf3e2b5177f7bd5f76635",
".git/objects/2a/fefb15581e890d092aa567117a9cbd7107d201": "38b3a8ade19be906053ff69c3cc38c7d",
".git/objects/43/f3f2532f5d1a9287f9a1ea5c53aa6c392faf7d": "6d9fb2383ea24f9c5e3301910479e05d",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/5c/6321b7e34b8b11362569cd0ac4fb850ccbdbee": "9b26e333617721e43aaf31585485c1fe",
".git/objects/65/2e68d7fc76f7f79376c28ea25da3bfd569c1d9": "c6f84edc6146787a05e337436c18e5b4",
".git/objects/62/5429d0ede3981bbb64ba53ff425cc83da0aaf4": "f876ba4f7e2d54d91dd4c19d1f0c61e9",
".git/objects/08/0e37696f9251a1d8570d82e8a23ba12db62b4e": "f81d0aa75eede6c88b35615bf87af9a3",
".git/objects/01/163b5e8b78022bf7dd85e008ec1e50525b5b24": "f7d99b1f9314823c113e86e924bc7547",
".git/objects/39/83e71482193acef64b5082706f471884835d55": "b1651af13c0ca2088c3a21c691446ee2",
".git/objects/0f/d397a50ed5dab4a82ff20456e75e109491ca5a": "a5edb4d4b022ca0fbaa723567c77b56d",
".git/objects/dd/56eabbf298449db91bfa8644c6fbb20b8e6dda": "3fa6bb294070401dbba0b01792b84ce0",
".git/objects/dc/1f2b08603f6c890bf62db031941cdc2f0a3b5d": "7b05e82ca60a5821a91f8bc44956129d",
".git/objects/a9/a12c89f93f02b4ef27b7ef63eb8e629e230d83": "aaac5f3684a0e52ace325400adb755cf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b0/42dede2110e466be7b6334dc9f7621cf2c5bdc": "bc37bcf98d1d8df7a1de0a2d2816b4f3",
".git/objects/ef/32813164317e7a4a9fa19f7ae653214fae4c05": "84e561b781214460b4133f79b55fe6ad",
".git/objects/f9/54d39736c8b3085fd38260b4f0d644f912dd16": "0481b3a5896c14916600ea34b6a9e0dc",
".git/objects/f7/5a773bffa3a1362efeaa56e8643f127c3f47b9": "d846085c4628a3b56a1453617f477a1d",
".git/objects/c2/222293724c1993f18500926c2c763cbc62a64b": "60f946e4e793b3fc261294429cf8a64d",
".git/objects/f6/6ac42e9fcadc82d27f70a425fd9b0e166bc3a4": "ac89479bd4cc4ca2da54ff64e5f40d3e",
".git/objects/e7/c50789912bcd20b832a07cecf2c2ae8eb2a7f4": "af3da5f45b29cb6e8314780bf79c2c43",
".git/objects/2d/4a24a4c893c62fd625187084c467dc5ed57a9a": "2f691537931f238baaf3992cb397d47a",
".git/objects/2d/56f9dbc592db78f924bf75548c098a13de2b30": "0888b016ad00ef0ddf3100b8b7b3f3d2",
".git/objects/83/b19f1a4ae7b9002d10c5b1cceac1e6fe6801d7": "0e57a272d83428387df3eeef942ba07e",
".git/objects/84/5f54f5a733faafa8d60b3e80d006e2d460ce20": "1b5f2947e5e54f1106df9c48bf10c6f4",
".git/objects/84/cb5a32b85efc67d9177672df8cd913d3ce69a3": "963902c4988f3145e63d82650ed603fe",
".git/objects/2e/9d716a93eab1ca4723b0b9604eb1d32d1526ef": "c4f67783f11f05ab67e970167a50c9e6",
".git/objects/7a/c7af1d9471773d096ab652712fa198d256b6ec": "75363efe592ecf405ab83a2fc74e7c52",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "335b5d40b05005adc360f5301b426a3d",
".git/logs/refs/heads/gh-pages": "335b5d40b05005adc360f5301b426a3d",
".git/logs/refs/remotes/origin/gh-pages": "6c1b7fc61008e4db1d98a3e1529539b5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/refs/heads/gh-pages": "566d89173c155e23ae7647c5e7198347",
".git/refs/remotes/origin/gh-pages": "566d89173c155e23ae7647c5e7198347",
".git/index": "582ac6c17b8d48f1610c0bf9d987f40c",
".git/COMMIT_EDITMSG": "01eb2c11c2685e04a0e3b0556549b914",
"assets/LICENSE": "60ec1490030a0376b695a67f3fceda34",
"assets/images/parc_jouvet.png": "a18b10b03093747608b962f157aa649f",
"assets/images/sarah.png": "98efc9c4b032420fe6eb275f443ee647",
"assets/images/leo.png": "2fdd19aa7ee557cebf090def7b457c7b",
"assets/images/elise.png": "57dc6b203768798c6c1e3b02eaa7d485",
"assets/images/baptiste.png": "a5e9f3df41982f602046916130fbd693",
"assets/images/logo.png": "61a189703dc7d6f3c5f8a1867cf7b11f",
"assets/images/oriane.png": "916ee185417372fd94750438377c0e59",
"assets/AssetManifest.json": "c814e4734cc5920b99862ddee50d768d",
"assets/FontManifest.json": "5fa2baa1355ee1ffd882bec6ab6780c7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
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
        return fetch(event.request);
      })
  );
});
