require 'spec_helper'
require 'bookings/generators/install_generator'
require "generator_spec"

describe Bookings::Generators::InstallGenerator do
  destination File.expand_path("../../../tmp", __FILE__)
  
  before(:all) do
    prepare_destination
    run_generator
  end

  it "creates a migration file" do
    assert_migration "db/migrations/create_bookings.rb"
  end
end
