ENV["BUNDLER_VERSION"] ||= Gem::Requirement.new(">= 5.0").to_s
#ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
