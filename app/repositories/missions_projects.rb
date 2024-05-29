require 'rom-repository'

module Backend
  module Repositories
    class MissionsProjects < Repository[:missions_projects]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
