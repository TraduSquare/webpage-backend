# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Update < Backend::Action
        include Deps[repo: 'repositories.platforms']

        before :authenticate_call, :validate_params

        params do
          required(:id).value(:integer)
          required(:platform).hash
        end

        def handle(request, _response)
          handle_not_found('Plataforma') unless (platform = repo.update(request.params[:id], request.params[:platform]))

          handle_success(platform.to_h)
        end
      end
    end
  end
end
