# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:enable Style/FrozenStringLiteralComment

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'

# Configurations for chrome
# This method smells of :reek:TooManyStatements
class Config
  # This method smells of :reek:Utility-Function
  def config(link) # rubocop:disable Metrics/MethodLength
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit link
    driver.page_source
  end
end
