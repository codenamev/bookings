module Bookings
  module Generators
    class ControllerGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      
      def generate_bookings_controller
        template "bookings_controller.rb", "app/controllers/bookings_controller.rb"
        route "resources :bookings"
      end

    end
  end
end
