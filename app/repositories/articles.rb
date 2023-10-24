require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order(:created_at).to_a.map(&:to_h)
      end

      def find_by_id(id)
        articles&.where(id:)&.first&.to_h
      end

      def find_by_slug(slug)
        articles.where(slug:).first
      end

      def articles_with_projects
        articles.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
