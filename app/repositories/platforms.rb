require 'rom-repository'

module Backend
  module Repositories
    class Platforms < Repository[:platforms]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        platforms.order(:title).to_a.map(&:to_h)
      end

      def find_by_id(id)
        platforms&.where(id:)&.first&.to_h
      end

      def find_by_slug(slug)
        platforms.where(slug:).first
      end
    end
  end
end
