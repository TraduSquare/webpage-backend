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
        relations = %i[articles_projects]
        relations.each do |x|
          next if article[x].nil? || article[x].empty? 

          articles = articles.combine(x)
        end
        articles.command(:create).call(article)
      end

      def update_with_aggregates(article)
        relations = %i[articles_projects]
        relations.each do |x|
          next if article[x].nil? || article[x].empty? 

          articles = articles.combine(x)
        end
        articles.command(:update).call(article)
      end
    end
  end
end
