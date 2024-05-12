# frozen_string_literal: true

require 'rom-repository'

module Backend
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    def create(attrs_hash)
      changeset(:create, attrs_hash).map(:add_timestamps).commit
    end

    def update(attrs_hash)
      changeset(:update, attrs_hash).map(:touch).commit
    end
  end
end
