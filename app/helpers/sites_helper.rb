module SitesHelper
  def posts_column(record)
    record.posts.count
  end
end