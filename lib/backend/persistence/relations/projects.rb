module Backend
  module Persistence
    module Relations
      class Projects < ROM::Relation[:sql]
        schema(:projects, infer: true) do
          associations do
            has_many :articles_projects
            has_many :images_projects
            many_to_many :articles, through: :articles_projects
            many_to_many :images, through: :images_projects
          end
        end
      end
    end
  end
end
