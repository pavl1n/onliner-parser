# frozen_string_literal: true

require 'nokogiri'
$IMG = '//div[@class="b-tiles cfix "]/div/div/div/i[@class="b-tile-bg"]/@style'
$xpath_link_one = '//div[@class="b-tiles cfix "]/div/div/div/a[@class="b-tile-main"]/@href'
$xpath_link_two = '//div[@class="b-tiles cfix "]/div/div/div/a[@class="b-tile-main"]/@href'
$TITLE = '//div[@class="news-header__title"]/h1'
$TEXT = '//div[@class="news-text"]/p'
require_relative 'spec_helper'
require_relative 'writer'
require_relative 'info'


class Parser
  def initialize
    @config = Config.new
    @res = []

  end

  def html
    doc = Nokogiri::HTML(@config.config('https://www.onliner.by/'))
    links = doc.xpath($xpath_link_one)
    @img = doc.xpath($IMG)
    # @res << img.grep(/https?:\/\/[\w.-]+/) #img link
    help(links)

  end

  def help(links)
    links.each do |link|
      get(link)
    end
  end

  def get(link)
    html = Nokogiri::HTML(@config.config(link))
    begin
    title = html.xpath($TITLE).first.content.strip.capitalize
    text = html.xpath($TEXT).to_a
    rescue
      puts 'not a news'
    end
    puts title
    puts text
    saving(title, text, @img)
  end

  def saving(title, text, image)
    @res << Info.new(title, text, image)
    puts @res
  end
end

parse = Parser.new
parse.html
Writer.write(parse.res, 'output.txt')
