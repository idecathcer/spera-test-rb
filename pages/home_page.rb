require_relative "#{File.dirname(__FILE__)}/../pages/core_page"

# stores all page objects and initialize them
module Pages
  # Store home page object
  class HomePage < CorePage

    LOG_IN_LINK = { class: 'login' }.freeze

    def initialize(driver)
      super driver
    end

    def go_to_authentication_page
      click_on(LOG_IN_LINK)
      AuthenticationPage.new(@@driver)
    end
  end
 end