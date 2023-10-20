# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Index < Backend::Action
        include Deps[repo: 'repositories.projects']

        def handle(*, response)
          projects = repo.all

          response.body = projects.to_json
        end
      end
    end
  end
end
