# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Create < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :authenticate_call, :validate_params

        params do
          required(:mission).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:description).filled(:string)
            required(:email).filled(:string)
            required(:featured_image).filled(:string)
          end
        end

        def handle(request, _response)
          handle_server_error unless (mission = repo.create(request.params[:mission]))

          handle_success(mission.to_h, 201)
        end
      end
    end
  end
end
