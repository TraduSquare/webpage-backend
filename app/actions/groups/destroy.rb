# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Destroy < Backend::Action
        include Deps[repo: 'repositories.groups']

        before :validate_params

        params do
          required(:id).value(:integer)
        end

        def handle(request, _response)
          repo.delete(request.params[:id])
          handle_success('¡Éxito! Se ha eliminado el grupo correctamente')
        end
      end
    end
  end
end
