# cache-forever

This package adds a URL route "/cache" which serves files in `public`
with the cache header set to enable caching.

Thus, if you have a file `public/image.jpg`, then

    <img src="/image.jpg">

will display the image without caching (the Meteor default), while

    <img src="/cache/image.jpg">

will display the same image with caching.  Note, that if you use
caching, you need to *change the URL* if you change the contents of
the file to get the browser to fetch the new version.  An easy way to
do this is to add a URL query parameter:

    <img src="/cache/image.jpg?1">

and then increment the version number if you change the image.
Alternatively, you can simply give the image a different name when you
change it.
