module Backend
  module Persistence
    module Relations
      class Platforms < ROM::Relation[:sql]
        schema(:platforms, infer: true)
      end
    end
  end
end
