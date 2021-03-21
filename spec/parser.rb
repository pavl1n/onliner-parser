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
    @res = []
    @doc = Nokogiri::HTML(@config.config(ONLINER))
    @links = [XPATH_LINK_ONE, XPATH_LINK_TWO, XPATH_LINK_THREE]
  end

  def html
    @links.each { |link| Call.links_call(@doc.xpath(link)) }
  end

end

parse = Parser.new
parse.html
