require_relative '../pages/core_page'
module Pages
  # stores authentication page object
  class AuthenticationPage < CorePage
    AUTH_FORM = { id: 'create-account_form' }.freeze
    EMAIL_INPUT_FIELD = { id: 'email_create' }.freeze
    FORM_SUBMIT_BUTTON = { id: 'SubmitCreate' }.freeze
    ERROR_BOX = { id: 'create_account_error' }.freeze
    REGISTRATION_FORM = { id: 'account-creation_form' }.freeze
    def initialize(driver)
      super driver
    end

    # starts creating an account with given email
    def start_creating_account_with_email(*email)
      type(EMAIL_INPUT_FIELD, email) if email
      click_on(FORM_SUBMIT_BUTTON)
      self
    end

    def error_box?
      wait_for(ERROR_BOX)
    end

    def account_form?
      wait_for(REGISTRATION_FORM)
    end

  end
  end