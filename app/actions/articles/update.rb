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
          handle_not_found('Noticia') unless (article = repo.update(request.params[:id], request.params[:article]))

          handle_success(article.to_h)
        end
      end
    end
  end
end
