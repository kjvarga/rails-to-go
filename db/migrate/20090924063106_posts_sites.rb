class PostsSites < ActiveRecord::Migration
  def self.up
    create_table :posts_sites, :id => false do |t|
      t.references :post
      t.references :site
    end
  end

  def self.down
    drop_table :posts_sites
  end
end
