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
          handle_not_found('Proyecto') if (project = repo.with_aggregates(request.params[:slug])).empty?

          handle_success(project)
        end
      end
    end
  end
end
