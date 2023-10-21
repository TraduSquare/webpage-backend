module Backend
  module Persistence
    module Relations
      class ArticlesProjects < ROM::Relation[:sql]
        schema(:articles_projects, infer: true) do
          associations do
            belongs_to :articles
            belongs_to :projects
          end
        end
      end
    end
  end
end
