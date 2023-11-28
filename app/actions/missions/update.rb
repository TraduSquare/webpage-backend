# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Update < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :validate_params

        params do
          required(:id).value(:integer)
          required(:mission).hash
        end

        def handle(request, _response)
          mission_id = request.params[:id]
          handle_not_found unless repo.find_by_id(mission_id)

          handle_exception unless (mission = repo.update(mission_id, request.params[:mission]))

          handle_success(mission.to_h)
        end
      end
    end
  end
end
