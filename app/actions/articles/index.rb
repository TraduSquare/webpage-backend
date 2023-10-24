# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Index < Backend::Action
        include Deps[repo: 'repositories.articles']

        def handle(*, response)
          articles = repo.all

          response.format = :json
          halt 200, { message: articles }.to_json
        end
      end
    end
  end
end
