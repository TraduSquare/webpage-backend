module Backend
  module Persistence
    module Relations
      class MissionsProjects < ROM::Relation[:sql]
        schema(:missions_projects, infer: true) do
          associations do
            belongs_to :missions
            belongs_to :projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
