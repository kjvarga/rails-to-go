class User < ActiveRecord::Base
  has_many :posts
  
  acts_as_authentic
  validates_presence_of :first_name, :last_name, :account_type
  attr_protected :account_type
  
  #
  # Dynamically add:
  #   account type discovery methods: is_admin_type?, is_user_type?
  #     is_admin_or_author_type?, is_user_or_author_type?
  #
  def method_missing(method_id, *arguments)
    if match = /^is_(\w+)_type\?$/.match(method_id.to_s)
      types = match[1].split('_or_')
      types.include?(self.account_type)
    else
      super
    end
  end
  
  def name; to_label; end
  
  def to_label
    "#{first_name} #{last_name}"
  end
  
  def self.account_types; ['user', 'author', 'admin']; end

  # Only admins can destroy users
  def authorized_for_destroy?
    return false unless current_user && current_user.is_admin_type?
  end
end

# == Schema Info
# Schema version: 20090925080529
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