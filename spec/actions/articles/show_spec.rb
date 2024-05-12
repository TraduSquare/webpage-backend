# frozen_string_literal: true

RSpec.describe 'GET /articles/:id', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
      'HTTP_AUTHORIZATION' => ENV['JWT_TOKEN'] }
  end
  let(:articles) { app['persistence.rom'].relations[:articles] }

  context 'returns a article given info' do
    let!(:article_slug) do
      articles.insert(title: 'MUAJAJAJAJA3', slug: 'muajajajajaj', content: 'a', featured_image: 'https://tradusquare.es')
    end

    it 'renders the article with slug' do
      get "/articles/#{articles.first[:slug]}", nil, request_headers

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to include(
        'title' => 'MUAJAJAJAJA3', 'slug' => 'muajajajajaj', 'content' => 'a',
        'projects' => [], 'comments' => []
      )
    end

    it 'renders 1 article 100 times' do
      100.times do
        get "/articles/#{articles.first[:slug]}", nil, request_headers
      end

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to include(
        'title' => 'MUAJAJAJAJA3', 'slug' => 'muajajajajaj', 'content' => 'a',
        'projects' => [], 'comments' => []
      )
    end
  end

  context 'when no article matches the given id' do
    it 'returns not found' do
      get '/articles/jejejeje', nil, request_headers

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        'message' => 'Noticia. Elemento no encontrado'
      )
    end
  end
end
