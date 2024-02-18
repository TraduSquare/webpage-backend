# frozen_string_literal: true

module Backend
  module Actions
    module API
      class Login < Backend::Action
        before :authenticate_call

        def handle(request, response)
          handle_success('Authenticated')
        end
      end
    end
  end
end
