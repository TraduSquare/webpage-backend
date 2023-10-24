module Backend
  module Persistence
    module Relations
      class Groups < ROM::Relation[:sql]
        schema(:groups, infer: true) do
          associations do
            has_many :groups_projects
            many_to_many :projects, through: :groups_projects
          end
        end
      end
    end
  end
end
