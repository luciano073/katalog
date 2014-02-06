module FilmsHelper
  def normalize_title(str = 'none') #Film title (ex. "terminator, the" becomes "the terminator")
    re = /,\s+[ao]s?n?\z|,\s+the\z|,\s+u[mn]a?s?\z/i
    # str ||= "nenhum"
    str.sub!(re, '')
    return str unless $~
    str.prepend("#{$~.to_s.delete(",").lstrip} ")
  end
end
