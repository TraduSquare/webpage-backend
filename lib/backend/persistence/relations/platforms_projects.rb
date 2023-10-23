module Backend
  module Persistence
    module Relations
      class PlatformsProjects < ROM::Relation[:sql]
        schema(:platforms_projects, infer: true) do
          associations do
            belongs_to :platforms, on_delete: :cascade
            belongs_to :projects, on_delete: :cascade
          end
        end
      end
    end
  end
end
