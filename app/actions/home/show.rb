# frozen_string_literal: true

module Backend
  module Actions
    module Home
      class Show < Backend::Action
        def handle(*, response)
          response.body = "Welcome to Bookshelf"
        end
      end
    end
  end
end
