# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Update < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :authenticate_call, :validate_params

        params do
          required(:id).value(:integer)
          required(:project).hash
        end

        def handle(request, _response)
          handle_not_found('Proyecto') unless (project = repo.update(request.params[:id], request.params[:project]))

          handle_success(project.to_h)
        end
      end
    end
  end
end
