require 'rom-repository'

module Backend
  module Repositories
    class Groups < Repository[:groups]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        grpups.order(:created_at).to_a.map(&:to_h)
      end

      def groups_with_projects
        grpups.combine(:projects).to_a.map(&:to_h)
      end
    end
  end
end
