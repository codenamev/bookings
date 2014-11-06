require 'rubygems'
require 'rspec'

ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))

$LOAD_PATH << File.join(ROOT, 'lib')
$LOAD_PATH << File.join(ROOT, 'lib', 'bookings')
require File.join(ROOT, 'lib', 'bookings.rb')

Dir[File.join(ROOT, 'spec', 'support', '**', '*.rb')].each{|f| require f }
