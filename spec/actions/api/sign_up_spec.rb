# frozen_string_literal: true

RSpec.describe 'GET /api/sign_up', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
      'HTTP_AUTHORIZATION' => ENV['JWT_TOKEN'] }
  end
  context 'given valid params' do
    let(:params) do
      { email: 'test@test.com',
        first_name: 'test',
        last_name: 'test',
        roles: ['Read'] }
    end

    it 'Creates a jwt token from params' do
      post '/api/sign_up', params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context 'given invalid params' do
    let(:params) do
      { email: 'test@test.com',
        first_name: 'test',
        last_name: 'test',
        roles: 'Read' }
    end

    it 'returns 422 unprocessable' do
      post '/api/sign_up', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
