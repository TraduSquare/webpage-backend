# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Update < Backend::Action
        include Deps[repo: 'repositories.groups']

        params do
          required(:id).value(:integer)
          required(:group).hash
        end

        def handle(request, _response)
          group_id = request.params[:id]
          halt 404, { message: 'No existe el grupo' }.to_json unless repo.find_by_id(group_id)

          halt 422, { message: request.params.errors }.to_json unless request.params.valid?

          group = repo.update(group_id, request.params[:group])
          halt 200, { message: '¡Éxito! Se ha modificado el grupo correctamente', content: group.to_h }.to_json
        end
      end
    end
  end
end
