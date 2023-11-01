# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Update < Backend::Action
        include Deps[repo: 'repositories.missions']

        params do
          required(:id).value(:integer)
          required(:mission).hash
        end

        def handle(request, _response)
          mission_id = request.params[:id]
          halt 404, { message: 'No existe el proyecto' }.to_json unless repo.find_by_id(mission_id)

          halt 422, { message: request.params.errors }.to_json unless request.params.valid?

          mission = repo.update(mission_id, request.params[:mission])
          halt 200, { message: '¡Éxito! Se ha modificadoo el objeto correctamente', content: mission.to_h }.to_json
        end
      end
    end
  end
end
