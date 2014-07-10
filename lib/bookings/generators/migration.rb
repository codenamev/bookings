require 'rails/generators/active_record'

module Bookings
  module Generators
    class Migration < ActiveRecord::Generators::Base
      desc "Create a migration to add bookings-specific fields to your model."

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def generate_migration
        migration_template "bookings_migration.rb", "db/migrate/create_bookings.rb"
      end
    end
  end
end
