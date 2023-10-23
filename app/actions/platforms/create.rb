# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Create < Backend::Action
        include Deps[repo: 'repositories.platforms']

        params do
          required(:platform).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:image_url).filled(:string)
          end
        end

        def handle(request, response)
          halt 522, { message: 'Invalid params' } unless request.params.valid?

          halt 500, { message: 'Error creating the platform' } unless (platform = repo.create(request.params[:platform]))

          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', data: platform.to_h }.to_json
        end
      end
    end
  end
end
