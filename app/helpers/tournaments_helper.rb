module TournamentsHelper

    def tournament_not_found(tournament)
        if tournament.blank?
            render json: { error: "Tournament Not Found" }, status: :not_found
            return false
        else
            return true
        end
    end

end
