# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Show < Backend::Action
        include Deps[repo: 'repositories.groups']

        before :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found('Grupo') unless (group = repo.with_aggregates(request.params[:slug]))

          handle_success(group)
        end
      end
    end
  end
end
