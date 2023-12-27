module Backend
  module Persistence
    module Relations
      class Comments < ROM::Relation[:sql]
        schema(:comments, infer: true) do
          associations do
            has_many :articles_comments

            many_to_many :articles, through: :articles_comments
          end
        end
      end
    end
  end
end
