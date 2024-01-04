# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Index < Backend::Action
        include Deps[articles: 'repositories.articles']

        def handle(*, response)
          response.format = :json
          handle_success(articles.last)
        end
      end
    end
  end
end
