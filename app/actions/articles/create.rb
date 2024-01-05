# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Create < Backend::Action
        include Deps[repo: 'repositories.articles']

        before :validate_params

        params do
          required(:article).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:content).filled(:string)
            required(:featured_image).filled(:string)
          end
        end

        def handle(request, _response)
          request.params[:article][:uuid] = generate_uuid
          handle_server_error unless (article = repo.create(request.params[:article]))

          handle_success(article.to_h, 201)
        end
      end
    end
  end
end
