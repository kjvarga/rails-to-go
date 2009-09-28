module CommentsHelper
  
  def sites_column(record)
    record.post.sites.first(3).collect do |site| 
      h(site.domain)
    end.join(', ')
  end

end