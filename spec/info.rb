require_relative 'writer'
require_relative 'spec_helper'

# Getting info from website
class Info
  def initialize(link)
    @html = Nokogiri::HTML(Config.new.config(link))
  end

  def get
    begin
      title = @html.xpath(TITLE).first.content.strip.capitalize
      text = @html.xpath(TEXT).first.to_s.gsub(/[^\s.,!?0-9А-Яа-я]/, '')
      img = @html.xpath(IMG).to_s.gsub(/\w+-\w+:\s\w+/, '')
      Writer.writer(title, text, img)
    rescue StandardError
      puts 'not a news'
    end
  end
end
