# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Index < Backend::Action
        include Deps[repo: 'repositories.articles']

        def handle(*, response)
          response.format = :json
          handle_success(repo.all)
        end
      end
    end
  end
end
