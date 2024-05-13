# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Show < Backend::Action
        include Deps[repo: 'repositories.articles']

        before :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found('Noticia') if (article = repo.with_aggregates(request.params[:slug])).empty?

          handle_success(article)
        end
      end
    end
  end
end
