# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Update < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :validate_params

        params do
          required(:id).value(:integer)
          required(:project).hash
        end

        def handle(request, _response)
          project_id = request.params[:id]
          handle_not_found unless repo.find(project_id)
          handle_server_error unless (project = repo.update(project_id, request.params[:project]))
          handle_success(project.to_h)
        end
      end
    end
  end
end
