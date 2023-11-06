# frozen_string_literal: true

RSpec.describe 'GET /projects', type: %i[request database] do
  let(:projects) { app['persistence.rom'].relations[:projects] }

  before do
    projects.insert(title: 'MUAJAJAJAJA3', slug: 'muajajajajaj', description: 'a')
  end

  context 'one project'
  it 'returns a list of projects' do
    get '/projects'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq('application/json; charset=utf-8')

    response_body = JSON.parse(last_response.body)

    expect(response_body).to(include { 'title' => 'MUAJAJAJA3' })
  end

  context 'hundreds of projects' do
    it 'Calls index 100 times' do
      100.times do
        get '/projects'
      end

      response_body = JSON.parse(last_response.body)
      expect(response_body).to(include { 'title' => 'MUAJAJAJA3' })
    end
  end
end
