class FaceboxExtension < Spree::Extension
  version "0.1"
  description "Spree image zoom using facebox: http://github.com/defunkt/facebox"
  url "http://github.com/Antiarchitect/spree-facebox"

  def activate

    # Add an extra large (xl) size to use for zooming.
    Image.attachment_definitions[:attachment][:styles] =
      { :mini => '48x48>', :small => '100x100>', :product => '240x240>',
        :large => '600x600>', :xl => '1000x1000>' }

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
          return true if image.attachment.path(style)
        end
        return false
      end
    end
  end
end
