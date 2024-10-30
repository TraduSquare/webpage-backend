module Backend
  module Persistence
    module Relations
      class ArticlesImages < ROM::Relation[:sql]
        schema(:articles_images, infer: true) do
          associations do
            belongs_to :articles
            belongs_to :images
          end
        end
        auto_struct(true)
      end
    end
  end
end
