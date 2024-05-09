# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Create < Backend::Action
        include Deps[repo: 'repositories.groups']

        before :validate_params

        params do
          required(:group).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
          end
        end

        def handle(request, _response)
          request.params[:group][:uuid] = generate_uuid
          handle_server_error unless (group = repo.create(request.params[:group]))
          handle_success({ message: '¡Éxito! Se ha creado el objeto correctamente', data: group.to_h }, 201)
        end
      end
    end
  end
end
