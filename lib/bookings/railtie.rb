require 'rails/railtie'

module Bookings

  class Railtie <  Rails::Railtie
    generators do
      require "bookings/generators/booking_model_generator"
      require "bookings/generators/controller_generator"
      require "bookings/generators/migration_generator"
      require "bookings/generators/install_generator"
    end
  end

end
