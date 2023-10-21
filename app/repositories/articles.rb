require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order(:title).to_a.map(&:to_h)
      end

      def find_by_id(id)
        articles&.where(id:)&.first&.to_h
      end

      def find_by_title(title)
        articles.where(title:).first
      end
    end
  end
end
