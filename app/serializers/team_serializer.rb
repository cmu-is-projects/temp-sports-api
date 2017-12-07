class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :season, :players

  def players
    User.by_sport(object.id).map do |u|
      UserSerializer.new(u)
    end
  end

end
