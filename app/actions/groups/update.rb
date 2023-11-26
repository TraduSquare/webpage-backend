# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Update < Backend::Action
        include Deps[repo: 'repositories.groups']

        before :validate_params

        params do
          required(:id).value(:integer)
          required(:group).hash
        end

        def handle(request, _response)
          group_id = request.params[:id]
          handle_not_found unless repo.find_by_id(group_id)
          handle_server_error unless (group = repo.update(group_id, request.params[:group]))
          halt 200, { message: '¡Éxito! Se ha modificado el grupo correctamente', content: group.to_h }.to_json
        end
      end
    end
  end
end
