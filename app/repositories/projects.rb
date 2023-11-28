require 'rom-repository'

module Backend
  module Repositories
    class Projects < Repository[:projects]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        projects.order(:created_at).to_a.map(&:to_h)
      end

      def with_articles
        projects.combine(:articles).to_a.map(&:to_h)
      end
    end
  end
end
