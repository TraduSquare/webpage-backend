module Backend
  module Persistence
    module Relations
      class Images < ROM::Relation[:sql]
        schema(:images, infer: true) do
          associations do
            has_many :articles_images
            has_many :images_projects
            many_to_many :articles, through: :articles_images
            many_to_many :projects, through: :images_projects
          end
        end
      end
    end
  end
end
