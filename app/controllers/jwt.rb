module Backend
  module Controllers
    class Jwt
      HMAC_SECRET = 'my$ecretK3y'.freeze
      require 'jwt'
      def generate_token(params)
        payload = generate_payload(params)
        payload[:exp] = params[:exp_time] if params[:exp_time]

        JWT.encode payload, HMAC_SECRET, 'HS256'
      end

      def decode_token(token = nil)
        return 'No se ha proporcionado un token JWT en la cabecera de la petición' if token.nil?

        begin
          JWT.decode token, HMAC_SECRET, true, { iss: 'TraduSquare', verify_iss: true, algorithm: 'HS256' }
        rescue JWT::InvalidIssuerError
          'No se ha podido autenticar la llamada. Token no emitido por TraduSquare.'
        rescue JWT::VerificationError
          'No se ha podido autenticar la llamada. Token inválido.'
        rescue JWT::DecodeError
          'No se ha podido autenticar la llamada. El token no se puede decodificar.'
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
