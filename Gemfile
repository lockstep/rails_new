# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Only define Ruby version once (i.e. for Heroku)
version_file = File.join(File.dirname(__FILE__), '.ruby-version')
ruby File.read(version_file).strip

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7'

gem 'react-rails'

gem 'webpacker'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.3.0'

# Use Puma as the app server
gem 'puma'

# Use SCSS for stylesheets
gem 'sass-rails'

# Automatically add vendor prefixes to CSS rules
gem 'autoprefixer-rails'

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Application monitoring
gem 'newrelic_rpm'

# Authorization
gem 'pundit'

# Authentication
gem 'devise', '~> 4.8.0'

# API serialization
gem 'jsonapi-serializer'

# App configuration
gem 'figaro'

# Exception tracking
gem 'sentry-rails'
gem 'sentry-sidekiq'

# Job queue
gem 'sidekiq'

# Security
gem 'secure_headers', require: false

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Storage
# gem "aws-sdk-s3", require: false

# Ruby metrics
gem 'barnes'

group :production do
  # Remove this if the app is not hosted on Heroku
  gem 'heroku-deflater'
  gem 'lograge'
  gem 'nakayoshi_fork'
  gem 'rack-timeout'
end

group :development, :test do
  # Call 'binding.break' anywhere in the code to stop execution and get a debugger console
  gem 'debug'

  gem 'foreman'

  # Warn about n+1 queries and unused includes
  gem 'bullet'
  # Debug page speed and memory usage
  gem 'memory_profiler'
  gem 'rack-mini-profiler', require: false
  # Performance profiling, works with NewRelic in develop mode
  gem 'ruby-prof'

  # Use Pry instead of IRB
  gem 'pry-doc'
  gem 'pry-rails'

  # Documentation
  gem 'yard'
end

group :development do
  gem 'brakeman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'nullalign'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Review emails in the browser on the fly
  gem 'letter_opener'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'bundler-audit', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  # Easy installation and use of chromedriver (and others) to run system tests
  # with Chrome
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  # CircleCI test metadata collection
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
  gem 'webmock'
end
