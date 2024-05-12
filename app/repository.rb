# frozen_string_literal: true

require 'rom-repository'

module Backend
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    def find_by(*args)
      @root.where(*args).one.to_h
    end

    def create(attrs_hash)
      @root.changeset(:create, attrs_hash).map(:add_timestamps).commit
    end

    def update(attrs_hash)
      @root.changeset(:update, attrs_hash).map(:touch).commit
    end
  end
end
