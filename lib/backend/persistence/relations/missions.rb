module Backend
  module Persistence
    module Relations
      class Missions < ROM::Relation[:sql]
        schema(:missions, infer: true) do
          associations do
            has_many :missions_projects
            many_to_many :projects, through: :missions_projects
          end
        end
      end
    end
  end
end
