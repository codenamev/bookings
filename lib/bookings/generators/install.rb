module Bookings
  module Generators
    class Install < Rails::Generators::Base
      source_root File.expand_path("../", __FILE__)

      def install
        generate "bookings:migration"
        generate "bookings:booking_model"
      end

    end
  end
end
