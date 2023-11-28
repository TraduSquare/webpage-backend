# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Index < Backend::Action
        include Deps[repo: 'repositories.projects']

        def handle(_request, response)
          response.format = :json
          handle_success(repo.with_articles)
        end
      end
    end
  end
end
