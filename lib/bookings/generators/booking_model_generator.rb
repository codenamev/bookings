module Bookings
  module Generators
    class BookingModelGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_bookings_model
        copy_file "booking_model.rb", "app/models/booking.rb"
      end

    end
  end
end
