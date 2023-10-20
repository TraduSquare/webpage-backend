# frozen_string_literal: true

RSpec.describe 'GET /projects', type: %i[request database] do
  let(:projects) { app['persistence.rom'].relations[:projects] }

  before do
    projects.insert(title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz')
    projects.insert(title: 'Test Driven Development', author: 'Kent Beck')
  end

  it 'returns a list of projects' do
    get '/projects'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq('application/json; charset=utf-8')

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq([
                                  { 'title' => 'Practical Object-Oriented Design in Ruby', 'author' => 'Sandi Metz' },
                                  { 'title' => 'Test Driven Development', 'author' => 'Kent Beck' }
                                ])
  end
end
