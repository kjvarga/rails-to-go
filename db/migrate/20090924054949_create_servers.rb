class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :shared_secret
      t.text :metadata
      t.timestamps
    end
    
    require 'config/initializers/site_defaults'
    Server.create(:shared_secret => SiteDefaults::SHARED_SECRET, :metadata => {})
  end
  
  def self.down
    drop_table :servers
  end
end
