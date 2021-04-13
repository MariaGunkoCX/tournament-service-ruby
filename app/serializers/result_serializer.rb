class ResultSerializer < ActiveModel::Serializer
  attributes :answers, :user

  def user
    UserSerializer.new(object.user).as_json
  end

end
