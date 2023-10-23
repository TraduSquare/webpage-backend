module Backend
  module Persistence
    module Relations
      class GroupsProjects < ROM::Relation[:sql]
        schema(:groups_projects, infer: true) do
          associations do
            belongs_to :groups, on_delete: :cascade
            belongs_to :projects, on_delete: :cascade
          end
        end
      end
    end
  end
end
