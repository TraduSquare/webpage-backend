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
          handle_not_found('Grupo') unless (group = repo.update(request.params[:id], request.params[:group]))

          handle_success(group.to_h)
        end
      end
    end
  end
end
