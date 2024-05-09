# frozen_string_literal: true

RSpec.describe Backend::Controllers::Jwt do
  context 'token invalid'
  jwt_class = Backend::Controllers::Jwt.new
  it 'Token vacío o imposible de decodificar' do
    jwt_class.decode_token('') == 'No se ha podido autenticar la llamada. El token no se puede decodificar.'
  end

  it 'Sin token en la header' do
    jwt_class.decode_token == 'No se ha proporcionado un token JWT en la cabecera de la petición'
  end

  it 'Token inválido' do
    jwt_class.decode_token('asdawsa') == 'No se ha podido autenticar la llamada. Token inválido.'
  end

  it 'Token inválido' do
    jwt_class.decode_token('eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZSIsImlhdCI6MTcwODI2NDQ5NSwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIkdpdmVuTmFtZSI6IkpvcmdlIiwiU3VybmFtZSI6Ikd1ZXJyYSIsIkVtYWlsIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIlJvbGVzIjpbIlJlYWQiLCJXcml0ZSJdfQ.uH0pc4uw30w5RQB3YZWiy1Ura-TvTns4EK7vF0PQpIA') == 'No se ha podido autenticar la llamada. Token no emitido por TraduSquare.'
  end
end
