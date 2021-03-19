# frozen_string_literal: true

require_relative 'spec_helper'
#require_relative 'info'
require_relative 'call'
require 'nokogiri'
require 'csv'
IMG = '//div[@class="news-header__preview"]/div[@class="news-header__image"]/@style'
XPATH_LINK_ONE = '//div[@class="g-middle-i"]/div/div/div/div/a[@class="b-tile-main"]/@href'
XPATH_LINK_TWO = '//div[@class="b-tiles cfix "]/div/div/div/a[@class="b-tile-main"]/@href'
XPATH_LINK_THREE = '//div[@class="b-main-page-grid-4 b-main-page-news-2"]/ul/li/a[@class="b-teasers-2__teaser-i"]/@href'
TITLE = '//div[@class="news-header__title"]/h1'
TEXT = '//div[@class="news-text"]/p'

# Parsing title, text and img links from onliner.by
class Parser
  def initialize
    @config = Config.new
    @res = []
    @doc = Nokogiri::HTML(@config.config('https://www.onliner.by/'))
    @links = [XPATH_LINK_ONE, XPATH_LINK_TWO, XPATH_LINK_THREE]
  end

  def html
    @links.each { |link| Call.links_call(@doc.xpath(link)) }
  end

end

parse = Parser.new
parse.html
