class Post < ActiveRecord::Base
  acts_as_taggable
  
  has_and_belongs_to_many :sites
  has_many :comments, :as => :commentable, :dependent => :destroy
  belongs_to :user
  
  serialize :metadata, Hash
  attr_accessible :title, :content, :metadata, :metadata_as_text
  
  validates_presence_of :title, :content
  
  def metadata_as_text
    return '' if self.metadata.nil?
    self.metadata.sort.map{ |i| i.join(': ') }.join("\n")
  end
  
  def metadata_as_text=(text)
    self.metadata = {}
    key_values = text.strip.split("\n").map do |line|
      key, value = line.split(':', 2)
      self.metadata[key.strip] = value.strip unless key.nil? or value.nil?
    end
  end

  def to_label
    self.title
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