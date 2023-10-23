module Backend
  module Persistence
    module Relations
      class ArticlesProjects < ROM::Relation[:sql]
        schema(:articles_projects, infer: true) do
          associations do
            belongs_to :articles, on_delete: :cascade
            belongs_to :projects, on_delete: :cascade
          end
        end
      end
    end
  end
end
