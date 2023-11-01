# frozen_string_literal: true

RSpec.describe 'GET /projects', type: %i[request database] do
  let(:projects) { app['persistence.rom'].relations[:projects] }

  before do
    projects.insert(title: 'MUAJAJAJAJA3', slug: 'muajajajajaj', description: 'a')
  end

  it 'returns a list of projects' do
    get '/projects'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq('application/json; charset=utf-8')

    response_body = JSON.parse(last_response.body)

    expect(response_body).to include { 'title' => 'MUAJAJAJA3' }

    context 'hundreds of creations' do
      it 'creates hundreds of projects' do
        (1..100).each do |i|
          post '/projects', { project: { title: i.to_s, slug: i.to_s, description: i.to_s } }.to_json, request_headers
        end
  
        expect(last_response).to be_created
      end
    end
  end
end
