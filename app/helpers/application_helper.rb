# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title
    'Air Syndicate'
  end
  
  def display_error_messages(&block)
    errors = yield block
    return errors.empty? ? '' : "<div class='error'>#{errors}</div>"
  end
end
