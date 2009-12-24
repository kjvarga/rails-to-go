require File.dirname(__FILE__) + '/../spec_helper'

describe Server do
  it "should be valid" do
    Server.new.should be_valid
  end
end


# == Schema Info
# Schema version: 20090925080529
#
# Table name: servers
#
#  id            :integer         not null, primary key
#  metadata      :text
#  shared_secret :string(255)
#  created_at    :datetime
#  updated_at    :datetime