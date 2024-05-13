require 'rom-repository'

module Backend
  module Repositories
    class Platforms < Repository[:platforms]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        platforms.order(:title)
      end
    end
  end
end
