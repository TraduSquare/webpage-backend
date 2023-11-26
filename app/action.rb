# auto_register: false
# frozen_string_literal: true

require 'hanami/action'
require 'uuid7'

module Backend
  class Action < Hanami::Action
    config.handle_exception ROM::TupleCountMismatchError => :handle_server_error

    private

    def handle_not_found
      halt 404, { message: 'No encontrado' }.to_json
    end

    def handle_server_error(_request, _response, _exception)
      halt 500, { message: 'Algo ha salido mal, probablemente sea culpa nuestra' }.to_json
    end

    def handle_success(message)
      halt 500, { message: }.to_json
    end

    def validate_params(request, _response)
      halt 422, { message: 'Parámetros no válidos' }.to_json unless request.params.valid?
    end

    def generate_uuid
      UUID7.generate
    end
  end
end
