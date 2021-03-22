require_relative 'writer'
require_relative 'spec_helper'

# Getting info from website
class GetDataFromLink
  def initialize(link)
    @html = Nokogiri::HTML(Config.new.config(link))
  end

  def getting_title
    @html.xpath(TITLE).first.content.strip.capitalize
  end

  def getting_text
    @html.xpath(TEXT).first.to_s.gsub(TEXT_REGULAR, '')
  end

  def getting_img
    @html.xpath(IMG).to_s.gsub(IMG_REGULAR, '')
  end

  def aggregate
    GenerateCsv.generate(getting_title, getting_text, getting_img)
  rescue StandardError => e
    puts e
  end
end
