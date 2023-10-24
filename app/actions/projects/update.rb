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

        def handle(request, _response)
          project_id = request.params[:id]
          halt 404, { message: 'No existe el proyecto' } unless repo.find_by_id(project_id)

          halt 422, { message: request.params.errors } unless request.params.valid?

          project = repo.update(project_id, request.params[:project])
          halt 200, { message: '¡Éxito! Se ha modificadoo el objeto correctamente', content: project.to_h }.to_json
        end
      end
    end
  end
end
