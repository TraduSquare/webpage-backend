# frozen_string_literal: true

module Backend
  class Routes < Hanami::Routes
    root to: 'home.show'

    get '/projects', to: 'projects.index'
    get '/projects/:slug', to: 'projects.show'
    put '/projects/:id', to: 'projects.update'
    post '/projects', to: 'projects.create'
    delete '/projects/:id', to: 'projects.destroy'

    get '/platforms', to: 'platforms.index'
    get '/platforms/:slug', to: 'platforms.show'
    put '/platforms/:id', to: 'platforms.update'
    post '/platforms', to: 'platforms.create'
    delete '/platforms/:id', to: 'platforms.destroy'

    get '/articles', to: 'articles.index'
    get '/articles/:slug', to: 'articles.show'
    put '/articles/:id', to: 'articles.update'
    post '/articles', to: 'articles.create'
    delete '/articles/:id', to: 'articles.destroy'

    get '/groups', to: 'groups.index'
    get '/groups/:slug', to: 'groups.show'
    put '/groups/:id', to: 'groups.update'
    post '/groups', to: 'groups.create'
    delete '/groups/:id', to: 'groups.destroy'

    get '/missions', to: 'missions.index'
    get '/missions/:slug', to: 'missions.show'
    put '/missions/:id', to: 'missions.update'
    post '/missions', to: 'missions.create'
    delete '/missions/:id', to: 'missions.destroy'
  end
end
