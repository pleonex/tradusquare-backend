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

        def handle(request, response)
          handle_not_found unless (article = repo.find_by(slug: request.params[:slug]))
          response.format = :json
          handle_success(article.to_json)
        end
      end
    end
  end
end
