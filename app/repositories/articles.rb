require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order(:created_at).to_a.map(&:to_h)
      end

      def with_projects
        articles.combine(:projects).to_a.map(&:to_h)
      end

      def last(limit)
        articles.order(articles[:created_at].qualified.desc).limit(limit).to_a.map(&:to_h)
      end

      def show_with_comments_and_projects(slug)
        return nil if (article = find_by_slug(slug).blank?)

        article.combine(:comments, :projects).to_a.map(&:to_h)
      end
    end
  end
end
