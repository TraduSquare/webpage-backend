module Backend
  module Persistence
    module Relations
      class Images < ROM::Relation[:sql]
        schema(:images, infer: true) do
          associations do
            has_many :articles_images
            has_many :images_projects
            has_many :articles, through: :articles_images
            has_many :projects, through: :images_projects
          end
        end
        auto_struct(true)
      end
    end
  end
end
