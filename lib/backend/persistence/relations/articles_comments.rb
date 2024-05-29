module Backend
  module Persistence
    module Relations
      class ArticlesComments < ROM::Relation[:sql]
        schema(:articles_comments, infer: true) do
          associations do
            belongs_to :articles, on_delete: :cascade
            belongs_to :comments, on_delete: :cascade
          end
        end
        auto_struct(true)
      end
    end
  end
end
