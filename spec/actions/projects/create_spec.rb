RSpec.describe 'POST /projects', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' }
  end

  context 'given valid params' do
    let(:params) do
      { project: { title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz' } }
    end

    it 'creates a project' do
      post '/projects', params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context 'given invalid params' do
    let(:params) do
      { project: { title: nil } }
    end

    it 'returns 422 unprocessable' do
      post '/projects', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end