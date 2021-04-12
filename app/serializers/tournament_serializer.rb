class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :start_date, :end_date, :results

  def results
    object.results.map { |result| ResultSerializer.new(result).as_json}
  end

end
