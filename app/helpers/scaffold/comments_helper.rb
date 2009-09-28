module Scaffold
  module CommentsHelper

    def created_at_column(record)
      time_ago_in_words(record.created_at) + ' ago'
    end
    
    # If you choose to show the sites in the comments listing  
    def sites_column(record)
      record.post.sites.collect do |site| 
        h(site.domain)
      end.join(', ')
    end

    def sites_form_column(record, input_name)
      record.post.sites.collect do |site| 
        h(site.domain)
      end.join(', ')
    end
  end
end