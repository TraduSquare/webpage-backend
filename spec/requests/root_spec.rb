# frozen_string_literal: true

RSpec.describe 'GET /', type: %i[request database] do
  it 'Sin token en el header' do
    get '/'
    expect(JSON.parse(last_response.body)['message']).to eq('No se ha proporcionado un token JWT en la cabecera de la petición')
  end

  context 'token invalido' do
    let(:request_headers) do
      { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
        'HTTP_AUTHORIZATION' => 'asdwadsfasfas' }
    end
    it 'Token inválido' do
      get '/', nil, request_headers
      expect(JSON.parse(last_response.body)['message']).to eq('No se ha podido autorizar la llamada. Token inválido.')
    end
  end
  context 'token de fuera de TS' do
    let(:request_headers) do
      { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
        'HTTP_AUTHORIZATION' => 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZWEiLCJpYXQiOjE3MTU1MzA5OTgsImF1ZCI6Ind3dy5leGFtcGxlLmNvbSIsInN1YiI6ImpvZ3VlcnNhbkBnbWFpbC5jb20iLCJHaXZlbk5hbWUiOiJKb3JnZSIsIlN1cm5hbWUiOiJHdWVycmEiLCJFbWFpbCI6ImpvZ3VlcnNhbkBnbWFpbC5jb20iLCJSb2xlcyI6WyJSZWFkIiwiV3JpdGUiXX0.HyxVbLHQ3lc6kzpK7rnwDkuVZjHUbPXTUYrk_OYut3k' }
    end
    it 'Token de fuera de TS' do
      get '/', nil, request_headers
      expect(JSON.parse(last_response.body)['message']).to eq('No se ha podido autorizar la llamada. Token no emitido por TraduSquare.')
    end
  end

  context 'sin permisos en el token' do
    let(:request_headers) do
      { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
        'HTTP_AUTHORIZATION' => 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZSIsImlhdCI6MTcxNTUzMTM4NiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIkdpdmVuTmFtZSI6IkpvcmdlIiwiU3VybmFtZSI6Ikd1ZXJyYSIsIkVtYWlsIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIlJvbGVzIjpbIiJdfQ.lZ4Q_KuL1TuZDR5M41CQXKVHiu4LwHH0hhMJkFe9mnE' }
    end
    it 'returns 401 unauthorized' do
      get '/', nil, request_headers
      expect(last_response).to be_unauthorized
    end
  end
end
