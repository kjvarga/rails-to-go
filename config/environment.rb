# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  config.gem "haml"
  config.gem 'chriseppstein-compass', :lib => 'compass', :source => 'http://gems.github.com'
  config.gem "mislav-will_paginate", :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'authlogic'
  config.gem 'searchlogic'
  config.gem "mbleigh-acts-as-taggable-on", :source => "http://gems.github.com", :lib => "acts-as-taggable-on"
  
  # cron tasks
  config.gem 'javan-whenever', :lib => false, :source => 'http://gems.github.com'

  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  config.time_zone = 'UTC'
end