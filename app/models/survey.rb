class Survey < ApplicationRecord
  # Survey type constant
  SURVEY_TYPES = [ ['Pre Practice Survey', 'pre'], ['Post Practice Survey', 'post'] ]

  # Relations
  belongs_to :user

  # Scopes
  scope :pre, -> { where('survey_type = ?', :pre) }
  scope :post, -> { where('survey_type = ?', :post) }
  scope :chronological, -> { order(completed_on: :desc)}

  # Validations

  # Validates all fields present
  validates_presence_of :survey_type, :response, :user_id
  # Validates type of survey (pre/post)
  validates_inclusion_of :survey_type, in: SURVEY_TYPES.map{|key, value| value}, message: "is not a survey option"
  # Validate date completed_on?

  # VALIDATE THE SURVEY
  # validate :valid_response

  # Methods

  # Converts string to json / hash object
  def responseToJson(responseString)
    # responseJson = JSON.parse(responseString)
    responseJson
  end

  private

  def valid_response
    # check if each question ID has a string response
    counter = 1
    responseToJson(self.response).each do |ans|
      unless ans[counter.to_s].instance_of?(String)
        return false
      end
      counter += 1
    end
    true
  end

end
