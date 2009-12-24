class Scaffold::SitesController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :sites do |config|
    # Columns
    config.columns = [:domain, :domain_hash, :site_hash, :posts]
    
    # Editing
    config.update.columns.exclude :posts
    
    # Adding
    config.create.columns.exclude :posts
    
    # Listing
    config.list.sorting = {:domain => 'ASC'}
    config.list.columns = [:domain, :posts]
    
    # Exclude actions
    config.actions.exclude :delete
    config.actions.exclude :show
    config.actions.exclude :search
  end
end