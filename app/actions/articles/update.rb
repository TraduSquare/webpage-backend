# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Update < Backend::Action
        include Deps[repo: 'repositories.articles']

        params do
          required(:id).value(:integer)
          required(:article).hash
        end

        def handle(request, _response)
          article_id = request.params[:id]
          halt 404, { message: 'No existe el artículo' } unless repo.find_by_id(article_id)

          halt 422, { message: request.params.errors } unless request.params.valid?

          article = repo.update(article_id, request.params[:article])
          halt 200, { message: '¡Éxito! Se ha modificado el objeto correctamente', content: article.to_h }.to_json
        end
      end
    end
  end
end
