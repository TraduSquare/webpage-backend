# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Show < Backend::Action
        include Deps[repo: 'repositories.projects']

        before :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found unless (project = repo.find_by_slug(request.params[:slug]))
          halt 200, project.to_json
        end
      end
    end
  end
end
