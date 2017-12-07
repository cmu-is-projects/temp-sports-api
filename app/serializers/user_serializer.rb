class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :andrewID, :team_name, :studentClass, :major, :pre_surveys, :post_surveys
  # has_many :surveys

  def pre_surveys
    object.surveys.pre.chronological.map do |s|
      SurveySerializer.new(s)
    end
  end

  def team_name
    object.team.name
  end

  def post_surveys
    object.surveys.post.chronological.map do |s|
      SurveySerializer.new(s)
    end
  end

end
