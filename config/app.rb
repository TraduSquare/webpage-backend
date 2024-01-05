# frozen_string_literal: true

require 'hanami'
require 'rack'
require 'rack/cors'

module Backend
  class App < Hanami::App
    config.middleware.use :body_parser, :json
    config.actions.format :json
    config.logger.formatter = :json

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post delete put patch options head]
      end
    end

    environment(:development) do
      config.logger.stream = root.join('log').join('development.log')
      config.logger.options[:colorize] = true
    end
  end
end
