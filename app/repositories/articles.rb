require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order { created_at.desc }.to_a.map(&:to_h)
      end

      def with_aggregates(slug)
        articles.combine(:comments, :projects).where(slug:).one.to_h
      end
    end
  end
end
