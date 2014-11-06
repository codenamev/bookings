module Bookings
  module Generators
    require 'rails/generators/migration'

    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def generate_bookings_migration
        migration_template "bookings_migration.rb", "db/migrate/create_bookings.rb"
      end
    end
  end
end
