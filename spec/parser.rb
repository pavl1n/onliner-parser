# frozen_string_literal: true

require_relative 'config'
require_relative 'news_reader'
require_relative 'constants'
require 'nokogiri'
require 'csv'

# Parsing title, text and img links from onliner.by
class Parser
  def initialize
    @doc = Nokogiri::HTML(Config.new.config(ONLINER))
    @links = [
      XPATH_MAIN_TABLE,
      XPATH_MAIN_TABLE_SECOND,
      XPATH_LINK_TEASER,
      XPATH_LINK_CATALOG,
      XPATH_LINK_PEOPLE,
      XPATH_LINK_AUTO,
      XPATH_LINK_TECH
    ]
  end

  def html
    @links.each { |link| NewsReader.new(@doc.xpath(link)).read_all_news }
  end
end

Parser.new.html
