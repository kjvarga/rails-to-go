class Scaffold::CommentsController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :comments do |config|
    config.columns = [:comment, :name, :email, :created_at, :sites]
    #config.columns[:metadata_as_text].label = 'Metadata'
    #config.columns[:metadata_as_text].description = 'Use Key: Value pairs'    
    config.columns[:created_at].label = 'Added'
    config.list.columns = [:created_at, :comment]
    config.list.sorting = { :created_at => 'DESC' }
    config.actions.exclude :nested
    #config.nested.add_link("Posts's comments", [:comments])
    #config.columns[:association_column].includes = nil
  end
end