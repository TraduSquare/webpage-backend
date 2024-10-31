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
        relations = %i[groups_projects platforms_projects missions_projects]
        relations.each do |x|
          next if project[x].nil? || project[x].empty? 

          projects = projects.combine(x)
        end
        projects.command(:create).call(project)
      end
    end
  end
end
