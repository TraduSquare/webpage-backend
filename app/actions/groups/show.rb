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

        def handle(request, response)
          handle_not_found unless (group = repo.find_by_slug(request.params[:slug]))
          response.format = :json
          halt 200, group.to_json
        end
      end
    end
  end
end
