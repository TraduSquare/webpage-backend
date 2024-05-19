# frozen_string_literal: true

RSpec.describe 'GET /', type: %i[request database] do
  it 'Sin token en el header' do
    get '/'
    expect(JSON.parse(last_response.body)['message']).to eq('No se ha proporcionado un token JWT en la cabecera de la petición')
  end

  context 'Peticiones con tokens' do
    let(:request_headers) do
      { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' }
    end
    it 'Token inválido' do
      request_headers['HTTP_AUTHORIZATION'] = 'asdwadsfasfas'
      get '/', nil, request_headers
      expect(JSON.parse(last_response.body)['message']).to eq('No se ha podido autorizar la llamada. Token inválido.')
    end
    it 'Token de fuera de TS' do
      request_headers['HTTP_AUTHORIZATION'] =
        'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZWEiLCJpYXQiOjE3MTYxNDUxMjMsImF1ZCI6Ind3dy5leGFtcGxlLmNvbSIsInN1YiI6ImpvZ3VlcnNhbkBnbWFpbC5jb20iLCJHaXZlbk5hbWUiOiJKb3JnZSIsIlN1cm5hbWUiOiJHdWVycmEiLCJFbWFpbCI6ImpvZ3VlcnNhbkBnbWFpbC5jb20iLCJSb2xlcyI6WyJSZWFkIl19.nFStoYSN-ma_HGbhWRG1hcFF2AHBMijgkwrYyh8BXV0'
      get '/', nil, request_headers
      expect(JSON.parse(last_response.body)['message']).to eq('No se ha podido autorizar la llamada. Token no emitido por TraduSquare.')
    end

    it 'returns 401 unauthorized' do
      request_headers['HTTP_AUTHORIZATION'] =
        'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZSIsImlhdCI6MTcxNTUzNDcyMywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIkdpdmVuTmFtZSI6IkpvcmdlIiwiU3VybmFtZSI6Ikd1ZXJyYSIsIkVtYWlsIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIlJvbGVzIjpbIiJdfQ.pXsiVzBWI9aT7XZYLD-BrShuzMwyaL4GXNsVghTzr80'
      get '/', nil, request_headers
      expect(last_response).to be_unauthorized
    end
  end

  context 'Headers correctas' do
    let(:request_headers) do
      { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
        'HTTP_AUTHORIZATION' => ENV['JWT_TOKEN'] }
    end
    it 'returns 401 unauthorized' do
      get '/', nil, request_headers
      expect(last_response).to be_successful
    end
  end
end
