require 'rom-repository'

module Backend
  module Repositories
    class Platforms < Repository[:platforms]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        platforms.order(:title).to_a.map(&:to_h)
      end

      def find(*args)
        platforms.where(*args).one.to_h
      end
    end
  end
end
