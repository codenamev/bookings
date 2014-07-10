require "bookings/version"
require "bookings/railtie"

module Bookings
  extend ActiveSupport::Concern

  module ClassMethods
    def bookable
      has_many :bookings, as: :bookable, dependent: :destroy

      validates_associated :bookings
    end
  end
end
