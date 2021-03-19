# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'

# Configurations
class Config
  def config(link)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10 # seconds
      config.default_driver = :selenium
    end
    # Visit
    browser = Capybara.current_session
    driver = browser.driver.browser
    #puts link
    browser.visit link
    driver.page_source
  end
end
