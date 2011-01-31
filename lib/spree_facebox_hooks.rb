class SpreeFaceboxHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  replace :product_images, 'products/product_images'
  insert_after :product_images, 'shared/script_for_facebox'
  insert_after :inside_head, 'shared/facebox_include'
end

