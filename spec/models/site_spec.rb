require File.dirname(__FILE__) + '/../spec_helper'

describe Site do
  it "should be valid" do
    Site.new.should be_valid
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