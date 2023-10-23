# frozen_string_literal: true

module Backend
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/projects', to: 'projects.index'
    get '/projects/:slug', to: 'projects.show'
    put '/projects/:id', to: 'projects.update'
    post '/projects', to: 'projects.create'
    delete '/projects/:id', to: 'projects.delete'

    get '/platforms', to: 'platforms.index'
    get '/platforms/:slug', to: 'platforms.show'
    put '/platforms/:id', to: 'platforms.update'
    post '/platforms', to: 'platforms.create'
    delete '/platforms/:id', to: 'platforms.delete'

    get '/articles', to: 'articles.index'
    get '/articles/:slug', to: 'articles.show'
    put '/articles/:id', to: 'articles.update'
    post '/articles', to: 'articles.create'
    delete '/articles/:id', to: 'articles.delete'
  end
end
