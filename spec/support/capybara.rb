require "rails_helper"
require "system/helper"
include RSpecHelper

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.automatic_label_click = true
end
