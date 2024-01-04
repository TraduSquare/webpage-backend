# frozen_string_literal: true

require 'rom-repository'

module Backend
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    def find(id)
      @root.where(id:)&.first&.to_h
    end

    def find_by(*args)
      @root.where(*args).first&.to_h
    end
  end
end
