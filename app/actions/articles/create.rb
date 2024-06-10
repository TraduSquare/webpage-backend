# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      # Class to create articles object. It includes params validation and handle method
      class Create < Backend::Action
        include Deps[repo: 'repositories.articles']

        before :validate_params

        params do
          required(:article).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:content).filled(:string)
            required(:featured_image).filled(:string)
            optional(:uuid).filled(:string)
            optional(:articles_projects).filled(:array)
          end
        end

        def handle(request, _response)
          request.params[:article][:uuid] = generate_uuid
          article = repo.create_with_aggregates(request.params[:article])

          handle_success(article.to_h, 201)
        end
      end
    end
  end
end
