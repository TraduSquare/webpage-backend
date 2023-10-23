# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Index < Backend::Action
        include Deps[repo: 'repositories.groups']

        def handle(*, response)
          groups = repo.all

          response.format = :json
          halt 200, { message: groups }.to_json
        end
      end
    end
  end
end
