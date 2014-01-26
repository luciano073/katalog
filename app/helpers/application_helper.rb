module ApplicationHelper
  def full_title(page_title)
    base_title = "KATALOG"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def normalize_title(str) #Film title (ex. "terminator, the" becomes "the terminator")
    re = /,\s+[ao]s?n?\z|,\s+the\z|,\s+u[mn]a?s?\z/i
    str ||= "nenhum"
    str.sub!(re, '')
    return str unless $~
    str.prepend("#{$~.to_s.delete(",").lstrip} ")
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
