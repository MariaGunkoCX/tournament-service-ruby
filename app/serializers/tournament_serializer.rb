class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :start_date, :end_date
end
