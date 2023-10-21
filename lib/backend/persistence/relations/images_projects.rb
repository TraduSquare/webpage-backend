module Backend
  module Persistence
    module Relations
      class ImagesProjects < ROM::Relation[:sql]
        schema(:images_projects, infer: true) do
          associations do
            belongs_to :projects
            belongs_to :images
          end
        end
      end
    end
  end
end
