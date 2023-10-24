# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Show < Backend::Action
        include Deps[repo: 'repositories.groups']

        params do
          required(:slug).value(:string)
        end

        def handle(request, response)
          halt 500, { message: request.params.errors } unless request.params.valid?
          group = repo.find_by_slug(request.params[:slug])
          response.format = :json
          halt 200, group.to_h.to_json if group
          halt 404, { message: 'Group not found' }
        end
      end
    end
  end
end
