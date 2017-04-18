# frozen_string_literal: true

require 'database_cleaner/active_record/truncation'
require 'database_cleaner/active_record/deletion'

# Disable rspec transactional fixtures and use database cleaner to do it.
# This is to fix problems with JS spec unable to access object created
# within a test due to transaction.
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :deletion
  end

  config.before(js: true) { DatabaseCleaner.strategy = :deletion }
  config.after(js: true) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
