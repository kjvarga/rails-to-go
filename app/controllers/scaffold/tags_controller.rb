class Scaffold::TagsController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :tags do |config|
    config.columns = [:name, :posts, :posts_titles]
    #config.columns[:posts].link = { 'association.reverse' => Post }
    config.list.sorting = { :name => 'ASC' }
    
    config.list.columns.exclude :posts_titles
    config.update.columns.exclude :posts, :posts_titles
    config.create.columns.exclude :posts, :posts_titles

    config.show.columns << :posts_titles
    config.show.columns.exclude :posts
    
    #config.actions.exclude :nested
  end
end