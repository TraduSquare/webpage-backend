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
          handle_not_found unless repo.find(article_id)
          handle_server_error unless (article = repo.update(article_id, request.params[:article]))
          handle_success(article.to_h)
        end
      end
    end
  end
end
