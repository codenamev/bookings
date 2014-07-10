require 'rails/railtie'

module Bookings

  class Railtie <  Rails::Railtie
    generators do
      require "generators/install"
    end
  end

end
