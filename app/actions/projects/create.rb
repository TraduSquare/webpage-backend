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
          end
        end

        def handle(request, _response)
          request.params[:project][:uuid] = generate_uuid
          project = repo.create(request.params[:project])

          handle_success(project.to_h, 201)
        end
      end
    end
  end
end
