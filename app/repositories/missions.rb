require 'rom-repository'

module Backend
  module Repositories
    class Missions < Repository[:missions]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        missions.order(:created_at).to_a.map(&:to_h)
      end

      def find_by_id(id)
        missions.where(id:)&.first&.to_h
      end

      def find_by_slug(slug)
        missions.where(slug:)&.first&.to_h
      end

      def missions_with_projects
        missions.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
