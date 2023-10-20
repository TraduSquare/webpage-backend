# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Update < Backend::Action
        include Deps[repo: 'repositories.projects']

        params do
          required(:id).value(:integer)
          required(:project).hash
        end

        def handle(request, response)
          project_id = request.params[:id]
          halt 522, { message: request.params.errors } unless request.params.valid?
          project = repo.update(project_id, request.params[:project])
          halt 201, { message: '¡Éxito! Se ha modificadoo el objeto correctamente', content: project }
        end
      end
    end
  end
end
