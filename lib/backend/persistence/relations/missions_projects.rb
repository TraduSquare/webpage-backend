module Backend
  module Persistence
    module Relations
      class MissionsProjects < ROM::Relation[:sql]
        schema(:missions_projects, infer: true) do
          associations do
            belongs_to :missions, on_delete: :cascade
            belongs_to :projects, on_delete: :cascade
          end
        end
      end
    end
  end
end
