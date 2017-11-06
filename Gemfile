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
gem 'rails', '~> 5.1.4'

# Use newest version of webpacker explicitly until Rails updates
gem 'webpacker', '~> 3.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.4'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Application monitoring
gem 'newrelic_rpm'

# Authorization
gem 'pundit'

# Authentication
gem 'devise', '~> 4.3.0'

# API serialization
gem 'active_model_serializers', '~> 0.10.0'

# App configuration
gem 'figaro'

# Exception tracking
gem 'airbrake', '~> 6.0', require: false

# Job queue
gem 'sidekiq'

# Security
gem 'secure_headers', require: false

group :production do
  # Remove this if the app is not hosted on Heroku
  gem 'heroku-deflater'
  gem 'lograge'
  gem 'nakayoshi_fork'
  gem 'rack-timeout'
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'foreman'

  # Warn about n+1 queries and unused includes
  gem 'bullet'
  # Debug page speed and memory usage
  gem 'memory_profiler'
  gem 'rack-mini-profiler', require: false
  # Performance profiling, works with NewRelic in develop mode
  gem 'ruby-prof'

  # Use Pry instead of IRB
  gem 'pry-byebug'
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
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
  gem 'webmock'
end
