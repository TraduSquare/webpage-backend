RSpec.describe 'POST /projects', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' }
  end

  context 'given valid params' do
    let(:params) do
      { project: { title: 'MUAJAJAJAJA3',
                   slug: 'muajajajajaj',
                   description: 'a' } }
    end

    it 'creates a project' do
      post '/projects', params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context 'hundreds of creations' do
    it 'creates hundreds of projects' do
      (1..100).each do |i|
        post '/projects', { project: { title: i.to_s, slug: i.to_s, description: i.to_s } }.to_json, request_headers
      end

      expect(last_response).to be_created
    end
  end

  context 'given invalid params' do
    let(:params) do
      { project: { title: nil, slug: nil, description: nil } }
    end

    it 'returns 422 unprocessable' do
      post '/projects', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
