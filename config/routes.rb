# frozen_string_literal: true

module Backend
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/projects', to: 'projects.index'
    get '/projects/:slug', to: 'projects.show'
    put '/projects/:id', to: 'projects.update'
    delete '/projects/:id', to: 'projects.delete'
    post '/projects', to: 'projects.create'

    post '/platforms', to: 'platforms.create'
    put '/platforms/:id', to: 'platforms.update'
    get '/platforms/:id', to: 'platforms.show'
    get '/platforms', to: 'platforms.index'
    delete '/platforms/:id', to: 'platforms.delete'

    delete '/articles/:id', to: 'articles.delete'
    get '/articles/:slug', to: 'articles.show'
    put '/articles/:id', to: 'articles.update'
    post '/articles', to: 'articles.create'
    get '/articles', to: 'articles.index'
  end
end
