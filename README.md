# Facebox

This is an extension for Spree, allowing to show zoomed product images to the customer:

It's based on Facebox:
http://github.com/defunkt/facebox

A lot of code was taken from this project:
http://github.com/eliotsykes/spree-zoom-photos

# Installation
Installation is quite simple:
* Add the gem source to your Gemfile
    `gem 'spree_facebox', :git => 'https://github.com/jmcarthur/spree-facebox.git', :branch => 'rails3'`
* Run `bundle install` and then `rake spree_facebox:install:assets`

# Consequences
New extra large image size of 1000x1000. So when new image uploaded on server it will have a 1000x1000 size in addition to default sizes.
There is a way to transform existing images to the larger size, however do make sure that your original images are of a sufficient quality for this to be worthwhile - see the next section for different methods.

#Resizing existing images
**Resize *all* images**: `rake paperclip:refresh:thumbnails`
**Resize only 'Image' images**: `rake paperclip:refresh:thumnails CLASS=Image` (This is the one you want to resize just your Product/Variant images.
**Resize a selction of Product images**:
* Jump into a console and grab a selection of Products whose images you want to resize (using Array.select, or AR finders, etc).
* `[collection].each { |product| product.images.each { |image| image.reprocess! }}`


All wishes, suggestions and improvements are welcome!

