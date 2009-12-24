class Server < ActiveRecord::Base
  serialize :metadata, Hash
  attr_accessible :shared_secret, :metadata, :metadata_as_text
  
  validates_presence_of :shared_secret
  
  def metadata_as_text
    '' if self.metadata.nil?
    self.metadata.sort.map{ |i| i.join(': ') }.join("\n")
  end
  
  def metadata_as_text=(text)
    self.metadata = {}
    key_values = text.strip.split("\n").map do |line|
      key, value = line.split(':', 2)
      self.metadata[key.strip] = value.strip unless key.nil? or value.nil?
    end
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