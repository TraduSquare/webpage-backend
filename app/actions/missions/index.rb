# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Index < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :authenticate_call

        def handle(*, response)
          response.format = :json
          handle_success(repo.all)
        end
      end
    end
  end
end
