require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order(:created_at).to_a.map(&:to_h)
      end

      def articles_with_projects
        articles.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
