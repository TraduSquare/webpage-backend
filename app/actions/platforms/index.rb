# frozen_string_literal: true

module Backend
  module Actions
    module Platforms
      class Index < Backend::Action
        include Deps[repo: 'repositories.platforms']

        def handle(*, response)
          platforms = repo.all

          response.format = :json
          halt 200, { message: platforms }.to_json
        end
      end
    end
  end
end
