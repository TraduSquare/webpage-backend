# frozen_string_literal: true

module Backend
  module Actions
    module Comments
      class Update < Backend::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
