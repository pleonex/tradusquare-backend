# frozen_string_literal: true

module Backend
  module Actions
    module Missions
      class Show < Backend::Action
        include Deps[repo: 'repositories.missions']

        before :authenticate_call, :validate_params

        params do
          required(:slug).value(:string)
        end

        def handle(request, _response)
          handle_not_found('Misión') unless (mission = repo.find_by_slug(request.params[:slug]))

          handle_success(mission)
        end
      end
    end
  end
end
