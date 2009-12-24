class Scaffold::PostsController < Scaffold::BaseController
  before_filter :require_admin_or_author_user
  
  active_scaffold :posts do |config|
    
    # Columns
    config.columns = [:created_at, :title, :content, :metadata_as_text, :sites, :sites_as_text, :comments, :tags, :tags_as_text]
    config.columns[:metadata_as_text].label = 'Metadata'
    config.columns[:metadata_as_text].description = 'Use Key: Value pairs separated by newlines'   
    config.columns[:metadata_as_text].form_ui = :textarea
    config.columns[:metadata_as_text].options = { :rows => 5, :cols => 40 } 
    config.columns[:created_at].label = 'Added'
    config.columns[:sites_as_text].label = 'Sites'
    config.columns[:tags_as_text].label = 'Tags'
    
    # Editing
    config.update.columns.exclude [:comments, :sites_as_text, :tags_as_text]
    
    # Adding
    config.create.columns.exclude [:comments, :sites_as_text, :tags_as_text]
    config.columns[:sites].form_ui = :select
    config.columns[:tags].form_ui = :select
    
    # Showing
    config.show.columns.exclude [:comments, :sites, :tags]
    
    # Listing
    config.list.columns.exclude [:content, :metadata_as_text, :sites, :tags]
    config.list.sorting = { :created_at => 'DESC' }
    
    # Nested
    config.subform.columns.exclude :post
    config.actions.exclude :delete
  end
  
  def before_update_save(record)
    tag_ids = params[:record][:tags].nil? ? [] : params[:record][:tags].values.collect { |val| val[:id] }
    record.tag_list = TagList.new(Tag.find(tag_ids).collect(&:name))
  end
end