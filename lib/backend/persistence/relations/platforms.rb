module Backend
  module Persistence
    module Relations
      class Platforms < ROM::Relation[:sql]
        schema(:platforms, infer: true)
        auto_struct(true)
      end
    end
  end
end
