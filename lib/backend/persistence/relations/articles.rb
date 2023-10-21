module Backend
  module Persistence
    module Relations
      class Articles < ROM::Relation[:sql]
        schema(:articles, infer: true) do
          associations do
            has_many :articles_projects
            many_to_many :projects, through: :articles_projects
          end
        end
      end
    end
  end
end
