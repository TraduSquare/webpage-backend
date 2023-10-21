require 'rom-repository'

module Backend
  module Repositories
    class Projects < Repository[:projects]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        projects.order(:title).to_a.map(&:to_h)
      end

      def find_by_id(id)
        projects&.where(id:)&.first&.to_h
      end

      def find_by_title(title)
        projects.where(title:).first
      end

      def projects_with_articles
        projects.combine(:articles).to_a.map(&:to_h)
      end
    end
  end
end
