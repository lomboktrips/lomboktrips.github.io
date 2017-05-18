
importScripts('/assets/sw-toolbox/sw-toolbox.js');

//toolbox.options.debug = true;
//toolbox.options.cache.name = "hi-lombok-v1";

var fileToCaches = [
	'/',
	'/index.html',
	'/index.html?homescreen=1',
	'/index.html?hs=1',
	'?homescreen=1',
	'/templates/category.html',
	'/templates/hi-grid.html',
	'/templates/hi-slider.html',
	'/templates/home.html',
	'/templates/home-maps.html',
	'/templates/location.html',
	'/templates/login.html',
	'/templates/offline.html',
	'/templates/single.html',

	'/assets/css/materialize.min.css',
	'/assets/css/font-awesome.min.css',
	'/assets/css/custom-style.css',

	'/assets/js/jquery.min.js',
	'/assets/js/materialize.min.js',
	'/assets/js/angular.min.js',
	'/assets/js/angular-route.min.js',
	'/hi-app.js',
	'/hi-controller.js',
	'/hi-service.js',
	'/hi-directive.js',
	'/service-worker.js',

	'/manifest.json',

	'/assets/img/apple-icon-57x57.png',
	'/assets/img/apple-icon-60x60.png',
	'/assets/img/apple-icon-72x72.png',
	'/assets/img/apple-icon-76x76.png',
	'/assets/img/apple-icon-114x114.png',
	'/assets/img/apple-icon-120x120.png',
	'/assets/img/apple-icon-144x144.png',
	'/assets/img/apple-icon-152x152.png',
	'/assets/img/apple-icon-180x180.png',

	'/assets/img/favicon.ico',
	'/assets/img/icon-16x16.png',
	'/assets/img/icon-32x32.png',
	'/assets/img/icon-96x96.png',
	'/assets/img/ms-icon-144x144.png',
	'/assets/img/marker.png',
	'/assets/img/off.gif',

	'/assets/videos/halal-tourism-lombok-1.mp4',
	'/assets/videos/halal-tourism-lombok-2.mp4',

	'/assets/fonts/material.woff2',
	'/assets/fonts/FontAwesome.otf',
	'/assets/fonts/fontawesome-webfont.eot',
	'/assets/fonts/fontawesome-webfont.svg',
	'/assets/fonts/fontawesome-webfont.ttf',
	'/assets/fonts/fontawesome-webfont.woff',
	'/assets/fonts/fontawesome-webfont.woff2'
];

toolbox.precache(fileToCaches);

toolbox.router.get('http://localhost/hi-lombok/api/(.*)', function(req, vals, opts) {
  return toolbox.networkFirst(req, vals, opts)
    .catch(function(error) {
      if (req.method === 'GET' && req.headers.get('accept').includes('text/html')) {
      	//console.log('You are now offline');
        return toolbox.cacheOnly(new Request('/'), vals, opts);
      }
      throw error;
    });
});