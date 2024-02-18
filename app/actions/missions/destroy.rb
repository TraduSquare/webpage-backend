# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Destroy < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :authenticate_call, :validate_params

        params do
          required(:id).value(:integer)
        end

        def handle(request, _response)
          handle_server_error unless repo.delete(request.params[:id])
          handle_success('¡Éxito! Se ha eliminado el objeto correctamente')
        end
      end
    end
  end
end
