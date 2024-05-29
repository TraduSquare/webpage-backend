require 'rom-repository'

module Backend
  module Repositories
    class GroupsProjects < Repository[:groups_projects]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
