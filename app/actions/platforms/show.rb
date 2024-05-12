# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Show < Backend::Action
        include Deps[repo: 'repositories.platforms']

        before :authenticate_call, :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found('Plataforma') unless (platform = repo.find_by(slug: request.params[:slug]))

          handle_success(platform)
        end
      end
    end
  end
end
