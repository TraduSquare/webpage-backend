require 'rom-repository'

module Backend
  module Repositories
    class Projects < Repository[:projects]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        projects.order(:title).to_a.map(&:to_h)
      end

      def with_aggregates(slug)
        projects.combine(:articles, :groups, :platforms, :missions).where(slug:).one.to_h
      end
    end
  end
end
