module Backend
  module Persistence
    module Relations
      class GroupsProjects < ROM::Relation[:sql]
        schema(:groups_projects, infer: true) do
          associations do
            belongs_to :groups
            belongs_to :projects
          end
        end
      end
    end
  end
end
