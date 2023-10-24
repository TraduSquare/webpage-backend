# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Show < Backend::Action
        include Deps[repo: 'repositories.articles']

        params do
          required(:slug).value(:string)
        end

        def handle(request, response)
          halt 500, { message: request.params.errors } unless request.params.valid?
          article = repo.find_by_slug(request.params[:slug])
          response.format = :json
          halt 200, article.to_h.to_json if article
          halt 404, { message: 'not_found' }
        end
      end
    end
  end
end
