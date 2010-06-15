= Facebox

This is an extension for Spree, allowing to show zoomed product images to the customer:

It's based on Facebox:
http://github.com/defunkt/facebox

A lot of code was taken from this project:
http://github.com/eliotsykes/spree-zoom-photos

= Installation
Installation is quite simple (from the spree app root):
<pre>
script/extension install git://github.com/Antiarchitect/spree-facebox.git
</pre>

= Consequences
New extra large image size of 1200x1200. So when new image were uploaded on server it will have a 1200x1200 size, old images will not.
I think there is the way to generate extra large size of them through rake (unconfirmed).

= TODO
Navigation between images from the facebox window

All wishes, suggestions and improvements are welcome!