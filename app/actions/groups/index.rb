# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Index < Backend::Action
        include Deps[repo: 'repositories.groups']

        def handle(_request, _response)
          handle_success(repo.all)
        end
      end
    end
  end
end
