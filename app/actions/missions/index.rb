# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Index < Backend::Action
        include Deps[repo: 'repositories.missions']

        def handle(*, response)
          missions = repo.all

          response.format = :json
          halt 200, { message: missions }.to_json
        end
      end
    end
  end
end
