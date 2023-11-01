# frozen_string_literal: true

module Backend
  module Actions
    module Articles
      class Create < Backend::Action
        include Deps[repo: 'repositories.articles']

        params do
          required(:article).hash do
            required(:title).filled(:string)
            required(:slug).filled(:string)
            required(:content).filled(:string)
            required(:featured_image).filled(:string)
          end
        end

        def handle(request, response)
          halt 422, { message: 'Invalid params' }.to_json unless request.params.valid?

          halt 500, { message: 'Error creating the article' }.to_json unless (article = repo.create(request.params[:article]))

          halt 201, { message: '¡Éxito! Se ha creado el objeto correctamente', data: article.to_h }.to_json
        end
      end
    end
  end
end
