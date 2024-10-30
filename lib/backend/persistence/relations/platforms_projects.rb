module Backend
  module Persistence
    module Relations
      class PlatformsProjects < ROM::Relation[:sql]
        schema(:platforms_projects, infer: true) do
          associations do
            belongs_to :platforms
            belongs_to :projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
