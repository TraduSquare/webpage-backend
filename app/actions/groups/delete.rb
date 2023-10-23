# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Delete < Backend::Action
        include Deps[repo: 'repositories.groups']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          group_id = request.params[:id]
          halt 522, { message: request.params.errors } unless request.params.valid?
          repo.delete(group_id)
          halt 200, { message: '¡Éxito! Se ha eliminado el grupo correctamente' }
        end
      end
    end
  end
end
