# Initializer for the GollumRails gem.
GollumRails::Setup.build do |config|

  # Set the path to the GIT-Repository.
  # 
  # Possible values are:
  #
  # => an absolute path: '/home/railsapp/db/wiki.git'
  # => a relative path: Path.join(RAILS_ROOT, 'db', 'wiki.git')
  # => a symbol (only application) it uses the currently active rails environment configuration for the path
  #
  config.repository = :application

end
