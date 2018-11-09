# stores all page objects and initialize them
module Pages
  # Stores Basic Class
  class CorePage
    ROOT_URL = 'http://automationpractice.com/index.php'.freeze
    IMPLICIT_WAIT_TIME = 10
    def initialize(driver)
      @@driver = driver
    end

    # load application front page
    def navigate_to_root
      @@driver.navigate.to(ROOT_URL)
      HomePage.new(@@driver)
    end

    # wraps Selenium::Webdriver quit
    def quit
      @@driver.quit
    end

    # wraps Selenium::Webdriver.find_element
    def find(element)
      @@driver.find_element(element)
    end

    # wraps Selenium::WebDriver::Element.send_keys
    def type(element, keys)
      wait_for(element)
      @@driver.find_element(element).send_keys(keys)
    end

    # wraps Selenium::WebDriver::Element.click
    def click_on(element, opt = {})
      wait_for(element)
      find(element).click
    end

    # take screenshot
    def take_screenshot
      @@driver.save_screenshot('error_screen.png')
    end

    # wrapper for implicit wait
    def wait_for(element, time = IMPLICIT_WAIT_TIME)
      Selenium::WebDriver::Wait.new(timeout: time).until do
        @@driver.find_element(element).displayed?
      end
    rescue StandardError => er
      puts er.inspect
      take_screenshot
      false
    end
  end
end