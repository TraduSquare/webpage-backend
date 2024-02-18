module Backend
  module Persistence
    module Relations
      class Articles < ROM::Relation[:sql]
        schema(:articles, infer: true) do
          associations do
            has_many :articles_comments
            has_many :articles_images
            has_many :articles_projects

            many_to_many :comments, through: :articles_comments
            many_to_many :images, through: :articles_images
            many_to_many :projects, through: :articles_projects
          end
        end
      end
    end
  end
end
