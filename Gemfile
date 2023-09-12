source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# TODO: revisit config.active_record.yaml_column_permitted_classes when this gets bumped
gem 'rails', '~> 7.0.8'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'mysql2', '~> 0.5.5'
# Use Puma as the app server
gem 'puma', '~> 6.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes

gem 'execjs'

#gem 'mini_racer', '<= 0.3'
#gem 'libv8', '~> 7.3'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'image_processing', '~> 1.12', '>= 1.12.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "comfortable_mexican_sofa", git: 'https://github.com/restarone/comfortable-mexican-sofa', tag: '3.5'

gem 'friendly_id'

gem "htmlentities"
# Reduces boot times through caching; required in config/boot.rb
gem 'webpacker', '~> 5.4'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.9'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '>= 3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
