# frozen_string_literal: true

RSpec.describe 'GET /projects/:id', type: %i[request database] do
  let(:request_headers) do
    { 'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json', 'HTTP_AUTHENTICATION' => ENV['JWT_PUBLIC_KEY'] }
  end
  let(:projects) { app['persistence.rom'].relations[:projects] }

  context 'returns a project given info' do
    let!(:project_slug) do
      projects.insert(title: 'MUAJAJAJAJA3', slug: 'muajajajajaj', description: 'a')
    end

    it 'renders the project with slug' do
      get "/projects/#{projects.first[:slug]}", request_headers

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to include(
        'title' => 'MUAJAJAJAJA3', 'slug' => 'muajajajajaj', 'description' => 'a'
      )
    end

    it 'renders 1 project 100 times' do
      100.times do
        get "/projects/#{projects.first[:slug]}"
      end

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to include(
        'title' => 'MUAJAJAJAJA3', 'slug' => 'muajajajajaj', 'description' => 'a'
      )
    end
  end

  context 'when no project matches the given id' do
    it 'returns not found' do
      get '/projects/jejejeje', request_headers

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        'message' => 'No encontrado'
      )
    end
  end
end
