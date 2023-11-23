# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Index < Backend::Action
        include Deps[repo: 'repositories.projects']

        def handle(*, response)
          projects = repo.with_articles

          response.format = :json
          halt 200, { message: projects }.to_json
        end
      end
    end
  end
end
