# frozen_string_literal: true

module Backend
  module Actions
    module Groups
      class Index < Backend::Action
        include Deps[repo: 'repositories.groups']

        def handle(_request, response)
          response.format = :json
          halt 200, { message: repo.all }.to_json
        end
      end
    end
  end
end
