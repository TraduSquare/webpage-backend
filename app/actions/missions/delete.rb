# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Delete < Backend::Action
        include Deps[repo: 'repositories.missions']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          mission_id = request.params[:id]
          halt 522, { message: request.params.errors } unless request.params.valid?
          repo.delete(mission_id)
          halt 200, { message: '¡Éxito! Se ha eliminado el objeto correctamente' }
        end
      end
    end
  end
end
