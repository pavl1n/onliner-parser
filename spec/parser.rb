# frozen_string_literal: true

require_relative 'spec_helper'
require_relative 'call'
require_relative 'constants'
require 'nokogiri'
require 'csv'

# Parsing title, text and img links from onliner.by
class Parser
  def initialize
    @config = Config.new
    @doc = Nokogiri::HTML(@config.config(ONLINER))
    @links = [XPATH_MAIN_TABLE,
              XPATH_MAIN_TABLE_SECOND,
              XPATH_LINK_TEASER,
              XPATH_LINK_CATALOG,
              XPATH_LINK_PEOPLE,
              XPATH_LINK_AUTO,
              XPATH_LINK_TECH]
  end

  def html
    @links.each { |link| OpenEachNews.links_call(@doc.xpath(link)) }
  end
end

Parser.new.html
