module ApplicationHelper
  def full_title(page_title)
    base_title = "KATALOG"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  
  def navigation
    if controller.action_name =~ /^[en]/
      base = t controller.controller_name, scope: :controller
      base << " >#{t controller.action_name, scope: :controller}"
    else
      base = t controller.controller_name, scope: :controller
    end
    base.html_safe
  end
end
