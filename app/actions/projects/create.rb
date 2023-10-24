# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Create < Backend::Action
        include Deps[repo: 'repositories.projects']

        params do
          required(:project).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
          end
        end

        def handle(request, response)
          halt 422, { message: 'Invalid params' } unless request.params.valid?

          halt 500, { message: 'Error creating the project' } unless (project = repo.create(request.params[:project]))

          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', data: project.to_h }.to_json
        end
      end
    end
  end
end
