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
          handle_success(group.to_h)
        end
      end
    end
  end
end
