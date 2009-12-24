class Scaffold::SitesListController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :sites do |config|
    # Columns
    config.columns = [:domain]
    
    # Listing
    config.list.sorting = {:domain => 'ASC'}
    
    # Exclude actions
    config.actions.exclude :delete
    config.actions.exclude :show
    config.actions.exclude :search
    config.actions.exclude :update
  end
end