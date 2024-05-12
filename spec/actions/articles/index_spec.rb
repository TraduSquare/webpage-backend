# frozen_string_literal: true

RSpec.describe 'GET /articles', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json',
      'HTTP_AUTHORIZATION' => ENV['JWT_TOKEN'] }
  end

  let(:projects) { app['persistence.rom'].relations[:projects] }
  let(:articles) { app['persistence.rom'].relations[:articles] }
  let(:articles_projects) { app['persistence.rom'].relations[:articles_projects] }

  before do
    projects.insert(title: 'MUAJAJAJAJA3', slug: 'muajajajajaj', description: 'a')
    10.times do |iteration|
      articles.insert(title: "Prueba-#{iteration}", slug: "prueba-#{iteration}", content: "Prueba-#{iteration}",
                      featured_image: "Prueba-#{iteration}")
      articles_projects.insert(article_id: articles.last[:id], project_id: projects.first[:id])
    end
  end

  context 'one article'
  it 'returns a list of articles' do
    get '/articles', nil, request_headers

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq('application/json; charset=utf-8')

    response_body = JSON.parse(last_response.body)

    expect(response_body).to(include { 'title' => 'MUAJAJAJA3' })
  end

  context 'hundreds of articles' do
    it 'Calls index 100 times' do
      100.times do
        get '/articles', nil, request_headers
      end

      response_body = JSON.parse(last_response.body)
      expect(response_body).to(include { 'title' => 'MUAJAJAJA3' })
    end
  end
end
