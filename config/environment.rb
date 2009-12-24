# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  config.gem "haml"
  config.gem 'compass'
  config.gem 'will_paginate'
  config.gem 'authlogic'
  config.gem 'searchlogic'
  config.gem 'acts-as-taggable-on'
  config.gem 'machinist'
  config.gem 'acts_as_commentable'

  config.time_zone = 'UTC'
end