class ResultSerializer < ActiveModel::Serializer
  attributes :tournament_id, :user_id, :answers
end
