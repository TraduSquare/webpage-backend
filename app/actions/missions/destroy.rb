# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Destroy < Backend::Action
        include Deps[repo: 'repositories.missions']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          mission_id = request.params[:id]
          halt 422, { message: request.params.errors }.to_json unless request.params.valid?
          repo.delete(mission_id)
          halt 200, { message: '¡Éxito! Se ha eliminado el objeto correctamente' }.to_json
        end
      end
    end
  end
end
