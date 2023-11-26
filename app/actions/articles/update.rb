# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Update < Backend::Action
        include Deps[repo: 'repositories.articles']

        before :validate_params

        params do
          required(:id).value(:integer)
          required(:article).hash
        end

        def handle(request, _response)
          article_id = request.params[:id]
          handle_not_found unless repo.find_by_id(article_id)
          handle_server_error unless (article = repo.update(article_id, request.params[:article]))
          halt 200, { message: '¡Éxito! Se ha modificado el objeto correctamente', content: article.to_h }.to_json
        end
      end
    end
  end
end
