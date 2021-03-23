require_relative 'get_data_from_link'
# Getting an array of news links and call each of them
class NewsReader
  def initialize(links)
    @links = links
  end

  def read_all_news
    @links.each { |link| GetDataFromLink.new(link).aggregate }
  end
end
