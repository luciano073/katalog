module ApplicationHelper
  def full_title(page_title)
    base_title = "KATALOG"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def normaliza_title(str)
    re = /,\s+[ao]s?n?\z|,\s+the\z|,\s+u[mn]a?s?\z/i
    str.sub!(re, '')
    return str unless $~
    str.prepend("#{$~.to_s.delete(",").lstrip} ")
  end

end
