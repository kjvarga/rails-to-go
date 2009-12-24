module Scaffold
  module PostsHelper
    #
    # ActiveScaffold customizations
    #
    def created_at_column(record)
      time_ago_in_words(record.created_at) + ' ago'
    end

    def comments_column(record)
      record.comments.count
    end

    # We don't want sites to link to anything because they are editable via 'Edit'
    def sites_as_text_column(record)
      record.sites.collect do |site| 
        h(site.domain)
      end.join(', ')
    end

    # We don't want tags to link to anything because they are editable via 'Edit'
    def tags_as_text_column(record)
      record.tags.collect do |tag| 
        h(tag.name)
      end.join(', ')
    end
              
    def options_for_association_conditions(association)
      if association.name == :tags
        # Return all tags for now, since we only have tags on posts
        return ["tags.id IN (?)", Tag.find(:all, :select => :id, :order => 'name ASC').collect(&:id)]
        
        # Uncomment the code below to limit to only tags attached to posts
        sql = Post.find_options_for_tag_counts(:on => :tags)
        tags = Tag.find :all, :select => 'tags.id', :conditions => sql[:conditions], :joins => sql[:joins]
        ids = tags.collect(&:id)
        return ["tags.id IN (?)", ids]
      else
        super
      end
    end
  end
end