# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookings/version'

Gem::Specification.new do |spec|
  spec.name          = "bookings"
  spec.version       = Bookings::VERSION
  spec.authors       = ["Valentino Stoll"]
  spec.email         = ["thevalentino+code@gmail.com"]
  spec.summary       = %q{Allow any model to accept booking requests and confirmations.}
  spec.description   = %q{Allow any model to accept booking requests and confirmations.}
  spec.homepage      = "https://github.com/codenamev/bookings"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.1.4"
  spec.add_dependency "aasm", "~> 3.2.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
