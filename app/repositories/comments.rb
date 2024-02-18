require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        comments.order(:created_at).to_a.map(&:to_h)
      end

      def last(limit)
        comments.combine(:articles).order(comments[:created_at].qualified.desc).limit(limit).to_a.map(&:to_h)
      end
    end
  end
end
