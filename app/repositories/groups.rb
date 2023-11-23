require 'rom-repository'

module Backend
  module Repositories
    class Groups < Repository[:groups]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        grpups.order(:created_at).to_a.map(&:to_h)
      end

      def find_by_id(id)
        grpups.where(id:)&.first&.to_h
      end

      def find_by_slug(slug)
        grpups.where(slug:)&.first&.to_h
      end

      def groups_with_projects
        grpups.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
