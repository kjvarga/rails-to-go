class Scaffold::PostsController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :posts do |config|
    
    # Columns
    config.columns = [:created_at, :title, :content, :metadata_as_text, :sites]
    config.columns[:metadata_as_text].label = 'Metadata'
    config.columns[:metadata_as_text].description = 'Use Key: Value pairs'   
    config.columns[:metadata_as_text].form_ui = :textarea
    config.columns[:metadata_as_text].options = { :rows => 5, :cols => 40 } 
    config.columns[:created_at].label = 'Added'
    
    # Listing
    config.list.columns.exclude [:content, :metadata_as_text]
    config.list.sorting = { :created_at => 'DESC' }
    
    # Nested
    config.nested.add_link("Show Sites", [:sites])
    config.nested.add_link("Show Comments", [:comments])
    config.actions.exclude :delete
  end
end