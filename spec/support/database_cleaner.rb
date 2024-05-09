# spec/support/database_cleaner.rb

require 'database_cleaner-sequel'

Hanami.app.prepare(:persistence)
DatabaseCleaner[:sequel, db: Hanami.app['persistence.db']]

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.url_allowlist = ['postgres://postgres@localhost', 'postgres://postgres@db']
  end

  config.around(:each, type: :database) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
