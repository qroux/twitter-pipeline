require "selenium-webdriver"

class TweetFetcher
  def self.search_image(url)
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to url.to_s

    return driver.find_element(:tag_name, "img")
  end
end