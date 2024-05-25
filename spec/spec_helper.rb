# frozen_string_literal: true

require 'pathname'
require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
  primary_coverage :branch
  minimum_coverage line: 90, branch: 75
  add_filter [%r{^/spec/}, '/config/app.rb', 'app/action.rb', 'Actions', 'app/actions']
  add_group 'Controllers', 'app/controllers'
  add_group 'Relations', 'lib/backend/persistence/relations'
  add_group 'Repositories', 'app/repositories'
  add_group 'Config', 'app/config'
end
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV['HANAMI_ENV'] ||= 'test'
require 'hanami/prepare'

require_relative 'support/rspec'
require_relative 'support/requests'
require_relative 'support/database_cleaner'
