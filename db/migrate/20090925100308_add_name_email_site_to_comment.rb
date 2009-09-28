class AddNameEmailSiteToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
    add_column :comments, :email, :string
    add_column :comments, :site_id, :integer
  end

  def self.down
    remove_column :comments, :site_id
    remove_column :comments, :email
    remove_column :comments, :name
  end
end
