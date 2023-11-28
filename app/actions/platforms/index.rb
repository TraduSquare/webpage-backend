# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Index < Backend::Action
        include Deps[repo: 'repositories.platforms']

        def handle(*, response)
          response.format = :json
          handle_success(repo.all)
        end
      end
    end
  end
end
