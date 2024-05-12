# frozen_string_literal: true

module Backend
  module Actions
    module API
      class SignUp < Backend::Action
        include Deps[jwt: 'controllers.jwt']

        before :validate_params

        params do
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
          required(:email).filled(:string)
          required(:roles).filled(:array)
          optional(:exp_time).filled(:integer)
        end

        def handle(request, _response)
          handle_success({ token: jwt.generate_token(request.params) }, 201)
        end
      end
    end
  end
end
