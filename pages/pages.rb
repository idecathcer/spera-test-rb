require 'selenium-webdriver'

page_objects = File.dirname(File.absolute_path(__FILE__))
Dir.glob(page_objects + '/*.rb').each {|file| require file}

# stores all page objects and initialize them
module Pages

end