# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Create < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :authenticate_call, :validate_params

        params do
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
            optional(:groups_projects).filled(:array)
            optional(:articles_projects).filled(:array)
            optional(:platforms_projects).filled(:array)
          end
        end

        def handle(request, _response)
          request.params[:project][:uuid] = generate_uuid
          project = repo.create_with_aggregates(request.params[:project])

          handle_success(project.to_h, 201)
        end
      end
    end
  end
end
