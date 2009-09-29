class Scaffold::PostsListController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :posts do |config|
    
    config.list.per_page = 10
    
    # Columns
    config.columns = [:created_at, :title]
    config.columns[:created_at].label = 'Added'
    
    # Editing
    config.update.columns.exclude [:comments, :sites_as_text]
    
    # Adding
    config.create.columns.exclude [:comments, :sites_as_text]
    config.columns[:sites].form_ui = :select
    
    # Listing
    config.list.sorting = { :created_at => 'DESC' }
    
    # Nested
    config.subform.columns.exclude :post
    [:nested, :update, :create, :search, :show, :delete].each do |action|
      config.actions.exclude action
    end
  end
end