class SurveySerializer < ActiveModel::Serializer
  attributes :id, :survey_type, :response, :user_id, :completed_on
  # belongs_to :user
end
