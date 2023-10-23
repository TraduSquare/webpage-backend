# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Update < Backend::Action
        include Deps[repo: 'repositories.platforms']

        params do
          required(:id).value(:integer)
          required(:platform).hash
        end

        def handle(request, _response)
          platform_id = request.params[:id]
          halt 404, { message: 'No existe el artículo' } unless repo.find_by_id(platform_id)

          halt 522, { message: request.params.errors } unless request.params.valid?

          platform = repo.update(platform_id, request.params[:platform])
          halt 200, { message: '¡Éxito! Se ha modificado el objeto correctamente', content: platform.to_h }.to_json
        end
      end
    end
  end
end
