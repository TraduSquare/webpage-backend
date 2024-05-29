require 'rom-repository'

module Backend
  module Repositories
    class Projects < Repository[:projects]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        projects.combine(:articles, :groups, :platforms, :missions).order(:title).to_a.map(&:to_h)
      end

      def with_aggregates(slug)
        projects.combine(:articles, :groups, :platforms, :missions).where(slug:).one.to_h
      end

      def create_with_aggregates(project)
        query = projects
        query = query.combine(:groups_projects) if project&.[](:groups_projects)&.size&.positive?
        query = query.combine(:articles_projects) if project&.[](:articles_projects)&.size&.positive?
        query = query.combine(:platforms_projects) if project&.[](:platforms_projects)&.size&.positive?
        query = query.command(:create).call(project)
      end
    end
  end
end
