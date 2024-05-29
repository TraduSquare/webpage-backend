module Backend
  module Persistence
    module Relations
      class Articles < ROM::Relation[:sql]
        schema(:articles, infer: true) do
          associations do
            has_many :articles_comments
            has_many :articles_images
            has_many :articles_projects

            has_many :comments, through: :articles_comments
            has_many :images, through: :articles_images
            has_many :projects, through: :articles_projects
          end
        end
      end
    end
  end
end
