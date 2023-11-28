# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Update < Backend::Action
        include Deps[repo: 'repositories.platforms']

        before :validate_params

        params do
          required(:id).value(:integer)
          required(:platform).hash
        end

        def handle(request, _response)
          platform_id = request.params[:id]
          handle_not_found unless repo.find(platform_id)

          handle_server_error unless (platform = repo.update(platform_id, request.params[:platform]))
          handle_success(platform.to_h)
        end
      end
    end
  end
end
