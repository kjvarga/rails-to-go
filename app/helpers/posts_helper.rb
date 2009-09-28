module PostsHelper
  #
  # ActiveScaffold customizations
  #
  def created_at_column(record)
    time_ago_in_words(record.created_at) + ' ago'
  end
  
  #def metadata_as_text_form_column(record, input_name)
  #  text_area :record, :metadata_as_text, :cols => 40, :rows => 5
  #end
  
  def options_for_association_conditions(association)
    raise
    if association.name == :sites
      #['sites.id not in (select posts_sites.sites_id where posts.id = ?)', Role.find_by_name('admin').id] unless current_user.admin?
      # Find only orphaned objects
      "#{association.primary_key_name} IS NULL"  # @see association_helpers.rb:32
    else
      super
    end
  end
end