module Scaffold
  module TagsHelper
    def posts_column(record)
      record.taggings.count
    end
    
    def posts_titles_column(record)
      Post.find_tagged_with(record).collect(&:title).each { |title| h(title) }.join('<br>')
    end
  end
end