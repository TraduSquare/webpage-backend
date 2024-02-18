# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Show < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :authenticate_call, :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found unless (project = repo.find_by(slug: request.params[:slug]))
          handle_success(project)
        end
      end
    end
  end
end
