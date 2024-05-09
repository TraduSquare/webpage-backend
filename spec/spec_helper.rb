# frozen_string_literal: true

require 'pathname'
require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
  minimum_coverage line: 90, branch: 50
  add_filter %r{^/spec/}
end
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV['HANAMI_ENV'] ||= 'test'
require 'hanami/prepare'

require_relative 'support/rspec'
require_relative 'support/requests'
require_relative 'support/database_cleaner'
