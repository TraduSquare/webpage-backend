module Backend
  module Persistence
    module Relations
      class Projects < ROM::Relation[:sql]
        schema(:projects, infer: true) do
          associations do
            has_many :articles_projects
            has_many :groups_projects
            has_many :images_projects
            has_many :platforms_projects
            has_many :missions_projects
            has_many :articles, through: :articles_projects
            has_many :groups, through: :groups_projects
            has_many :images, through: :images_projects
            has_many :missions, through: :missions_projects
            has_many :platforms, through: :platforms_projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
