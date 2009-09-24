require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    User.new.should be_valid
  end
end

# == Schema Info
# Schema version: 20090923074559
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  account_type        :string(255)     default("user")
#  crypted_password    :string(255)     not null
#  current_login_ip    :string(255)
#  email               :string(255)
#  failed_login_count  :integer         not null, default(0)
#  first_name          :string(255)
#  last_login_ip       :string(255)
#  last_name           :string(255)
#  login_count         :integer         not null, default(0)
#  password            :string(255)
#  password_salt       :string(255)     not null
#  perishable_token    :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  created_at          :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  last_request_at     :datetime
#  updated_at          :datetime