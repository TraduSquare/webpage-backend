# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Update < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :authenticate_call, :validate_params

        params do
          required(:id).value(:integer)
          required(:project).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            optional(:technical_info).filled(:string)
            optional(:decription).filled(:string)
            optional(:team).filled(:string)
            optional(:download).filled(:string)
            optional(:additional_info).filled(:string)
            optional(:buy_link).filled(:string)
            optional(:uuid).filled(:string)
            optional(:groups_projects)
            optional(:platforms_projects)
            optional(:missions_projects)
          end
        end

        def handle(request, _response)
          handle_not_found('Proyecto') unless (project = repo.update(request.params[:id], request.params[:project]))

          handle_success(project.to_h)
        end
      end
    end
  end
end
