# cache-forever

This is an experimental package which adds a URL route "/cache" which
serves files in `public` with the cache header set to enable caching.

So far the result is mixed.  In my tests with Chrome and Firefox, the
caching did work when navigating to the application page.  But,
following a code change, the browser fetched images again on the
window reload, even with the cache-control header set to
max-age=31536000.

This package does not interoperate with the `appcache` package.  (At
this point you'd want to use one or the other, but not both).  Files
served in the "/cache" URL route aren't available from the app cache
(they'd have to be listed a second time, which means that images would
be downloaded twice).  An open question is what to do with large
files that you choose not to cache in the app cache (the `onlineOnly`
option), but would like to enable the caching header for.

If you have a file `public/image.jpg`, then

    <img src="/image.jpg">

will display the image without caching (the Meteor default), while

    <img src="/cache/image.jpg">

will display the same image with caching.  Note, that if you use
caching, you need to *change the URL* if you change the contents of
the file to get the browser to fetch the new version.

An easy way to this is to use the
[cache-forever-helper](https://github.com/awwx/meteor-cache-forever-helper#readme)
package, which adds a `{{cache "/image.jpg"}}` template helper which adds the
file hash to the URL, so that the URL will change whenever the file does.

Alternatively, you can use your own URL query parameter:

    <img src="/cache/image.jpg?1">

and then increment the version number if you change the image.  Or,
simply give the image a different name if you change it.
