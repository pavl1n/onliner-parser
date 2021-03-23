# frozen_string_literal: true

require_relative 'generate_csv'
require_relative 'config'

# Getting info from website
class GetDataFromLink
  def initialize(link)
    @html = Nokogiri::HTML(Config.new.config(link))
  end

  def title
    @title ||= @html.xpath(TITLE).first.content.strip.capitalize
  end

  def text
    @text ||= @html.xpath(TEXT).first.to_s.gsub(TEXT_REGULAR, '')
  end

  def img
    @img ||= @html.xpath(IMG).to_s.gsub(IMG_REGULAR, '')
  end

  def aggregate
    GenerateCsv.generate(title, text, img)
  rescue StandardError => e
    puts e
  end
end
