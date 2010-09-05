unless Spree::Config[:stylesheets].include?('facebox,product')
  Spree::Config.set(:stylesheets => "#{Spree::Config[:stylesheets]},facebox,product")
end