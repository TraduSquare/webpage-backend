# frozen_string_literal: true

module Backend
  module Actions
    module Projects
      class Index < Backend::Action
        include Deps[projects: 'repositories.projects']

        before :authenticate_call

        def handle(_request, response)
          response.format = :json
          handle_success(projects.with_articles)
        end
      end
    end
  end
end
