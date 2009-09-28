class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :domain
      t.string :site_hash
      t.string :domain_hash
      t.timestamps
    end
    
    add_index :sites, :domain, :unique => true
    add_index :sites, :site_hash, :unique => true
    add_index :sites, :domain_hash, :unique => true
  end
  
  def self.down
    drop_table :sites
  end
end
