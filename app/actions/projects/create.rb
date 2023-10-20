# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Create < Backend::Action
        include Deps[repo: 'repositories.projects']

        params do
          required(:project).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          halt 522, { message: request.params.errors } unless request.params.valid?

          project = repo.create(request.params[:project])
          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', content: project.to_h }.to_json
        end
      end
    end
  end
end
