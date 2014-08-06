# Initializer for the GollumRails gem.
require 'strip_meta'
GollumRails::Setup.build do |config|

  config.repository = :application
  config.filters << [:StripMeta, :first]
end
