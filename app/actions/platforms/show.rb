# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Show < Backend::Action
        include Deps[repo: 'repositories.platforms']

        before :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, response)
          handle_not_found unless (platform = repo.find_by_slug(request.params[:slug]))
          response.format = :json
          handle_success(platform)
        end
      end
    end
  end
end
