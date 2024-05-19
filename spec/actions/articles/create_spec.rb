# frozen_string_literal: true

RSpec.describe 'POST /articles', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
      'HTTP_AUTHORIZATION' => ENV['JWT_TOKEN'] }
  end

  context 'given valid params' do
    let(:params) do
      { article: { title: 'MUAJAJAJAJA3',
                   slug: 'muajajajajaj',
                   description: 'a',
                   content: 'AAAAAAAAAA',
                   featured_image: 'https://test.es' } }
    end

    it 'creates a article' do
      post '/articles', params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context 'hundreds of creations' do
    it 'creates hundreds of articles' do
      100.times do |i|
        post '/articles',
             { article: { title: i.to_s, slug: i.to_s, description: i.to_s, content: i.to_s, featured_image: i.to_s } }.to_json, request_headers
      end

      expect(last_response).to be_created
    end
  end

  context 'given nil params' do
    let(:params) do
      { article: { title: nil, slug: nil, description: nil } }
    end

    it 'returns 422 unprocessable' do
      post '/articles', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end

  context 'given invalid type params' do
    let(:params) do
      { article: { title: 1, slug: 'muajajajajaj', description: 'a', content: 'AAAAAAAAAA', featured_image: 'https://test.es' } }
    end

    it 'returns 422 unprocessable' do
      post '/articles', params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
