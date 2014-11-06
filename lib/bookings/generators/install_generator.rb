module Bookings
  module Generators
    require 'rails/generators'

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../", __FILE__)

      def install
        generate "bookings:migration"
        generate "bookings:booking_model"
        generate "bookings:controller"
      end

    end
  end
end
