# frozen_string_literal: true

require 'hanami'

module Backend
  class App < Hanami::App
    config.middleware.use :body_parser, :json
  end
end
