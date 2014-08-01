# Image EXIF Orientation Service

This is a small web server that serves files. If the file is an image, it is rotated according to the orientation specified in its EXIF headers (if present). This will allow browsers to show the image with the correct orientation, since EXIF orientation information is usually ignored in HTML and CSS.

For performance reasons it is recommended to put the server behind a caching proxy, so that images only have to be processed once.

## Setup

* Install RVM
* `bundle`
* `bundle exec ruby service.rb`
* Everything in the `images` folder will be served, so put your images there or add a symlink to your images
