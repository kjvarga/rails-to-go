# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(title=nil)
    @title ||= title.nil? ? SiteDefaults::NAME : title + ' - ' + SiteDefaults::NAME
    return title.nil? ? @title : "<h2>#{title}</h2>"
  end
  
  def display_error_messages(&block)
    errors = yield block
    return errors.empty? ? '' : "<div class='error'>#{errors}</div>"
  end
end
