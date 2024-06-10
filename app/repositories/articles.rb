require 'rom-repository'

module Backend
  module Repositories
    class Articles < Repository[:articles]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        articles.order { created_at.desc }.to_a.map(&:to_h)
      end

      def with_aggregates(slug)
        articles.combine(:comments, :projects).where(slug:).one.to_h
      end

      def create_with_aggregates(article)
        relations = [:articles_projects]
        query = articles
        relations.each do |x|
          query = query.articles.combine(x) if article&.[](x)&.size&.positive?
        end
        query.command(:create).call(article)
      end
    end
  end
end
