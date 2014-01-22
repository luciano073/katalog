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

  # def lessif(options {})
  #   if "#{options[:model]}.#{options[:attribute]}"
  #     return "#{options[:form_builder]} #{options[:attr]}, class:'#{options[:class]}'" +
  #     " #{options[:data]} #{options[:value]}"
  #   else
      
  #   end
  # end
end
