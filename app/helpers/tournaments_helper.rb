module TournamentsHelper

    def render_tournament_not_found_error(tournament)
        if tournament.blank?
            render json: { error: "Tournament Not Found" }, status: :not_found
            false
        else
            true
        end
    end

end
