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
        relations = [:groups_projects, :articles_projects, :platforms_projects, :missions_projects]
        query = projects
        relations.each do |x|
          query = query.combine(x) if project&.[](x)&.size&.positive?
        end
        query = query.command(:create).call(project)
      end
    end
  end
end
