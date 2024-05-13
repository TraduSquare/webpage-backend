# frozen_string_literal: true

module Backend
  module Actions
    module Home
      class Show < Backend::Action
        before :authenticate_call

        def handle(*, response)
          response.body = 'Welcome to TraduSquare API!. If you are seeing this, that means you have rights to operate with this app. Congratulations!'
        end
      end
    end
  end
end
