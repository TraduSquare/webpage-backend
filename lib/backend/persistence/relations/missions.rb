module Backend
  module Persistence
    module Relations
      class Missions < ROM::Relation[:sql]
        schema(:missions, infer: true) do
          associations do
            has_many :missions_projects
            has_many :projects, through: :missions_projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
