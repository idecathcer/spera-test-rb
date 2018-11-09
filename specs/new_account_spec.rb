require 'rspec'
require 'phantomjs'
require 'headless'
require_relative File.dirname(__FILE__) + '/../pages/pages'

RSpec.configure  { include Pages }


describe 'Register a new account' do

  before :all do
    if ENV['HEADLESS'] then
      @headless = Headless.new
      @headless.start
      @app = CorePage.new(Selenium::WebDriver.for(:chrome))
    end

  end

  before :each do
    @state ||= @app.navigate_to_root.go_to_authentication_page
  end

  after :all do
    @headless.destroy if ENV['HEADLESS']
    @app.quit
  end

  it 'should cause error with no email provided' do
    expect(@state
               .start_creating_account_with_email
               .error_box?).to be
  end

  it 'should cause a validation error with incorrect email' do
    expect(@state
               .start_creating_account_with_email('1234567')
               .error_box?).to be
  end

  it 'should cause an error with an email already existed' do
    expect(@state
               .start_creating_account_with_email('test@test.test')
               .error_box?).to be
  end

  it 'should pass to the next form with unique email' do
    expect(@state
               .start_creating_account_with_email('unique@eamil.test')
               .account_form?).to be
  end
end