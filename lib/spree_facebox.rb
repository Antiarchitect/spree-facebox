require 'spree_core'
require 'spree_facebox_hooks'

module SpreeFacebox
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      #Add an extra large (xl) size to use for zooming.
      Image.attachment_definitions[:attachment][:styles] =
        { :mini => '48x48>', :small => '100x100>', :product => '240x240>',
          :large => '600x600>', :xl => '900x900>' }

      ProductsHelper.class_eval do
        def image_controls
          @image_controls ||= Facebox::ImageControls.new(@product)
        end
      end

      Product.class_eval do
        def has_image_without_style?(style)
          return true if contains_image_without_style?(images, style)
          if !variants.blank?
            variants.each do |variant|
              return true if contains_image_without_style?(variant.images, style)
            end
          end
          return false
        end

        private

        def contains_image_without_style?(images, style)
          return false if images.blank?
          images.each do |image|
            return true unless image.attachment.path(style)
          end
          return false
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

