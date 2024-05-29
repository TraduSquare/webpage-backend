module Backend
  module Persistence
    module Relations
      class Groups < ROM::Relation[:sql]
        schema(:groups, infer: true) do
          associations do
            has_many :groups_projects
            has_many :projects, through: :groups_projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
