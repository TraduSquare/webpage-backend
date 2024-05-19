require 'rom-repository'

module Backend
  module Repositories
    class Groups < Repository[:groups]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        groups.order(:title).to_a.map(&:to_h)
      end

      def with_aggregates(slug)
        groups.combine(:projects).where(slug:).one.to_h
      end
    end
  end
end
