# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Index < Backend::Action
        include Deps[repo: 'repositories.articles']

        def handle(*, response)
          response.format = :json
          halt 201, { message: repo.all }.to_json
        end
      end
    end
  end
end
