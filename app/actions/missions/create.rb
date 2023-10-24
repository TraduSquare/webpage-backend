# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Create < Backend::Action
        include Deps[repo: 'repositories.missions']

        params do
          required(:mission).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:description).filled(:string)
            required(:email).filled(:string)
            required(:featured_image).filled(:string)
          end
        end

        def handle(request, response)
          halt 422, { message: 'Invalid params' } unless request.params.valid?

          halt 500, { message: 'Error creating the mission' } unless (mission = repo.create(request.params[:mission]))

          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', data: mission.to_h }.to_json
        end
      end
    end
  end
end
