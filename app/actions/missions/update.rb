# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Update < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :authenticate_call, :validate_params

        params do
          required(:id).value(:integer)
          required(:mission).hash
        end

        def handle(request, _response)
          handle_not_found('Misión') unless (mission = repo.update(request.params[:id], request.params[:mission]))

          handle_success(mission.to_h)
        end
      end
    end
  end
end
