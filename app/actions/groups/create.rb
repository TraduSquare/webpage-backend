# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Create < Backend::Action
        include Deps[repo: 'repositories.groups']

        params do
          required(:group).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
          end
        end

        def handle(request, response)
          halt 422, { message: 'Invalid params' }.to_json unless request.params.valid?

          halt 500, { message: 'Error creating the group' }.to_json unless (group = repo.create(request.params[:group]))

          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', data: group.to_h }.to_json
        end
      end
    end
  end
end
