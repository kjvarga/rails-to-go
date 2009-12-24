# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# There should always be one and only one server instance
Server.create(:shared_secret => SiteDefaults::SHARED_SECRET, :metadata => {}) unless Server.count > 0
    
unless Rails.env.production?
  require 'spec/blueprint'
  seed_database
end
