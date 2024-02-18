# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Create < Backend::Action
        include Deps[repo: 'repositories.platforms']

        before :authenticate_call, :validate_params

        params do
          required(:platform).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:image_url).filled(:string)
          end
        end

        def handle(request, _response)
          handle_server_error unless (platform = repo.create(request.params[:platform]))

          handle_success(platform.to_h, 201)
        end
      end
    end
  end
end
