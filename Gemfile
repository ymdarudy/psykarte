source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", "~> 6.1.6"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# gem 'image_processing', '~> 1.2'

gem "bootsnap", ">= 1.4.4", require: false

gem "devise"
gem "devise-i18n"
gem "rexml"
gem "rails_admin", "~> 3.0"
gem "cancancan"
gem "chartkick"
gem "ransack"
gem "carrierwave"
gem "mini_magick"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "pry-byebug"
  gem "meta_request"
  gem "spring"
  gem "rspec-rails"
  gem "spring-commands-rspec"
  gem "factory_bot_rails"
  gem "launchy"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
