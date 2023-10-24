# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Show < Backend::Action
        include Deps[repo: 'repositories.projects']

        params do
          required(:slug).value(:string)
        end

        def handle(request, response)
          halt 500, { message: request.params.errors } unless request.params.valid?
          project = repo.find_by_slug(request.params[:slug])
          response.format = :json
          halt 200, project.to_h.to_json if project
          halt 404, { message: 'not_found' }
        end
      end
    end
  end
end
