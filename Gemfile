# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ">= 3.1.4", "< 3.5"

gem "rails", "~> 7.1.3"

gem "mysql2", "~> 0.5.6"
# Use Puma as the app server
gem "puma", "~> 6.6"
# But we use passenger in production
gem "passenger", "~> 6.0", ">= 6.0.27"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# Assets
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "sprockets-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "rollbar"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.13"

# Use ActiveStorage variant
gem "image_processing", "~> 1.14"

gem "comfortable_mexican_sofa", github: "restarone/comfortable-mexican-sofa", tag: "3.5"

gem "htmlentities"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

gem "rdoc", ">= 6.6.3.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  # Linters
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "standard", ">= 1.35.1", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"

  gem "listen", ">= 3.0.5", "< 3.10"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", ">= 3.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
