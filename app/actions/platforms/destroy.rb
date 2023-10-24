# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Destroy < Backend::Action
        include Deps[repo: 'repositories.platforms']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          halt 422, { message: request.params.errors } unless request.params.valid?
          repo.delete(request.params[:id])
          halt 200, { message: '¡Éxito! Se ha eliminado el objeto correctamente' }
        end
      end
    end
  end
end
