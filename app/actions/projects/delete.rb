# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Delete < Backend::Action
        include Deps[repo: 'repositories.projects']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          project_id = request.params[:id]
          halt 522, { message: request.params.errors } unless request.params.valid?
          repo.delete(project_id)
          halt 200, { message: '¡Éxito! Se ha eliminado el objeto correctamente' }
        end
      end
    end
  end
end
