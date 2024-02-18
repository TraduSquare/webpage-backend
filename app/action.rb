# auto_register: false
# frozen_string_literal: true

require 'hanami/action'
require 'uuid7'

module Backend
  class Action < Hanami::Action
    include Deps[jwt: 'controllers.jwt']
    config.handle_exception ROM::TupleCountMismatchError => :handle_server_error

    private

    def authenticate_call(request, _response)
      jwt_token = jwt.decode_token(request.env['HTTP_AUTHORIZATION'])
      halt 403, { message: jwt_token }.to_json if jwt_token.is_a? String

      has_permits = jwt_token&.first&.[]('Roles')&.include? 'Read'

      halt 401, { message: 'No estás autorizado a realizar esta acción' }.to_json unless has_permits
    end

    def handle_not_found
      halt 404, { message: 'No encontrado' }.to_json
    end

    def handle_server_error(_request, _response, _exception)
      halt 500, { message: 'Algo ha salido mal, probablemente sea culpa nuestra' }.to_json
    end

    def handle_success(message, code = 200)
      halt code, message.to_json
    end

    def validate_params(request, _response)
      halt 422, { message: 'Parámetros no válidos' }.to_json unless request.params.valid?
    end

    def generate_uuid
      UUID7.generate
    end
  end
end
