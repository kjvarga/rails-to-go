class Site < ActiveRecord::Base
  has_and_belongs_to_many :posts  
  attr_accessible :domain, :site_hash  
  validates_uniqueness_of :domain
  
  def to_label
    self.domain
  end
end


# == Schema Info
# Schema version: 20090925080529
#
# Table name: sites
#
#  id          :integer         not null, primary key
#  domain      :string(255)
#  domain_hash :string(255)
#  site_hash   :string(255)
#  created_at  :datetime
#  updated_at  :datetime