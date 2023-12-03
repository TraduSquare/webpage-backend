# frozen_string_literal: true

module Backend
  module Actions
    module API
      class GenerateToken < Backend::Action
        require 'jwt'
        before :validate_params

        params do
          required(:email).value(:string)
          required(:scope).value(:string)
        end

        def handle(request, _response)
          user_id = generate_uuid
          payload = { data: { user_id:, email: request.params[:scope] }, scopes: request.params[:scope] }
          private_key = OpenSSL::PKey::RSA.generate 2048
          secret = private_key.public_key.to_s
          token = JWT.encode payload, private_key, 'RS256'
          api_users.create({ user_id:, email: request.params[:email], token:, scope: request.params[:scope] })
          { secret:, token: }
        end
      end
    end
  end
end
