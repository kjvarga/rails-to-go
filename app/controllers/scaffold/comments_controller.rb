class Scaffold::CommentsController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :comments do |config|
    # Columns
    config.columns = [:comment, :name, :email, :created_at, :sites, :post]
    config.columns[:created_at].label = 'Added'
    
    # Listing
    config.list.columns = [:created_at, :comment, :post]
    config.list.sorting = { :created_at => 'DESC' }
    
    # Update
    config.update.columns.exclude :post
  end
end