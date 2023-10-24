require 'rom-repository'

module Backend
  module Repositories
    class Groups < Repository[:groups]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        groups.order(:created_at).to_a.map(&:to_h)
      end

      def find_by_id(id)
        groups&.where(id:)&.first&.to_h
      end

      def find_by_slug(slug)
        groups.where(slug:).first
      end

      def groups_with_projects
        groups.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
