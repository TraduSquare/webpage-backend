module Backend
  module Persistence
    module Relations
      class Comments < ROM::Relation[:sql]
        schema(:comments, infer: true) do
          associations do
            has_many :articles_comments
            has_many :articles, through: :articles_comments
          end
        end
        auto_struct(true)
      end
    end
  end
end
