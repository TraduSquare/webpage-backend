module Backend
  module Controllers
    class Jwt
      require 'jwt'
      def generate_token(params)
        hmac_secret = 'my$ecretK3y'

        payload = generate_payload(params)
        payload[:exp] = params[:exp_time] if params[:exp_time]

        JWT.encode payload, hmac_secret, 'HS256'
      end

      def decode_token(token)
        hmac_secret = 'my$ecretK3y'
        begin
          JWT.decode token, hmac_secret, true, { iss: 'TraduSquare', verify_iss: true, algorithm: 'HS256' }
        rescue JWT::InvalidIssuerError
          'No se ha podido autenticar la llamada. Token no emitido por TraduSquare.'
        rescue JWT::VerificationError
          'No se ha podido autenticar la llamada. Token invalido, no se ha podido decodificar.'
        end
      end

      private

      def generate_payload(params)
        {
          iss: 'TraduSquare',
          iat: Time.now.to_i,
          aud: 'www.example.com',
          sub: params[:email],
          GivenName: params[:first_name],
          Surname: params[:last_name],
          Email: params[:email],
          Roles: params[:roles]
        }
      end
    end
  end
end
