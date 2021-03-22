require_relative 'info'
# Reek said to move it to another class o_O
class OpenEachNews
  def self.links_call(links)
    links.each { |link| GetDataFromLink.new(link).aggregate }
  end
end
