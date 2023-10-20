# frozen_string_literal: true

module Backend
  class Routes < Hanami::Routes
    root to: 'home.show'
    get '/projects', to: 'projects.index'
    get '/projects/:title', to: 'projects.show'
    put '/projects/:id', to: 'projects.update'
    delete '/projects/:id', to: 'projects.destroy'
    post '/projects', to: 'projects.create'
  end
end
