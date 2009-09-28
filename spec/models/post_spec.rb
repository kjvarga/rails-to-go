require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it "should be valid" do
    Post.new.should be_valid
  end
end


# == Schema Info
# Schema version: 20090925080529
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  content    :text(255)
#  metadata   :text
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime