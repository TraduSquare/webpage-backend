# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Destroy < Backend::Action
        include Deps[repo: 'repositories.groups']

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          group_id = request.params[:id]
          halt 422, { message: request.params.errors }.to_json unless request.params.valid?
          repo.delete(group_id)
          halt 200, { message: '¡Éxito! Se ha eliminado el grupo correctamente' }.to_json
        end
      end
    end
  end
end
