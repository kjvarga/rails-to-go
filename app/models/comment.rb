class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  belongs_to :post, :foreign_key => 'commentable_id'
  
  default_scope :order => 'created_at ASC'
  
  def to_label
    self.comment
  end
end


# == Schema Info
# Schema version: 20090925080529
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer
#  user_id          :integer
#  comment          :text            default("")
#  commentable_type :string(255)
#  title            :string(50)      default("")
#  created_at       :datetime
#  updated_at       :datetime