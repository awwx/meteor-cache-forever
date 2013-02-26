Package.describe({
  summary: "adds a URL route /cache/ which serves files in public with caching enabled"
});

Package.on_use(function (api) {
  api.add_files('cache-server.js', 'server');
});
