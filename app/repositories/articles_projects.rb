require 'rom-repository'

module Backend
  module Repositories
    class ArticlesProjects < Repository[:articles_projects]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
