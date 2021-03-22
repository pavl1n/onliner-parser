# frozen_string_literal: true

require_relative 'writer'
require_relative 'spec_helper'

# Getting info from website
class Info
  def initialize(link)
    @html = Nokogiri::HTML(Config.new.config(link))
  end

  def get
    title = @html.xpath(TITLE).first.content.strip.capitalize
    text = @html.xpath(TEXT).first.to_s.gsub(TEXT_REGULAR, '')
    img = @html.xpath(IMG).to_s.gsub(IMG_REGULAR, '')
    Writer.writer(title, text, img)
  rescue StandardError
    puts 'not a news'
  end
end
