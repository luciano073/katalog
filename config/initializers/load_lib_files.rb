%w(personal_stuff).each do |req|
  require File.expand_path("../../../lib/#{req}", __FILE__)
end