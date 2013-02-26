    {app, bundle, require} = __meteor_bootstrap__
    gzippo = require 'gzippo'
    path   = require 'path'

A bit of a hack... assumes that files in `public` do in fact end up in
`static` (as opposed to `static_cacheable`).

But the end result is if you have a file `public/image.jpg`, the URL
`/image.jpg` will be served with caching disabled as usual, and the
URL `/cache/image.jpg` will serve the file with caching enabled.

    app.use(gzippo.staticGzip(
      path.join(bundle.root, 'static'),
      {prefix: '/cache/', clientMaxAge: 1000 * 60 * 60 * 24 * 365}
    ))
