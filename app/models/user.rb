class User < ApplicationRecord

  # List of allowable majors
  MAJORS = [['Information Systems','is'],['Business','business'],['Computer Science','cs'],['Engineering','engineering'],['Architecture', 'architecture'],['Humanities','humanities'],["Sciences","sciences"],['Other','other']]

  # use has_secure_password
  has_secure_password

  # Relations
  has_many :surveys
  belongs_to :team

  # Scopes
  scope :by_sport, ->(sportID) { where(team_id: sportID) }

  # Validations

  validates_presence_of :first_name, :last_name, :andrewID, :major
  # Account Validations
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  # validates uniqueness of AndrewIDs
  validates :andrewID, presence: true, uniqueness: { case_sensitive: false }
  # make sure student major is a valid major
  validates_inclusion_of :major, in: MAJORS.map{|key, value| value}, message: "is not an option"
  # user's student class needs to be FR, SO, JR, or SR
  validates_inclusion_of :studentClass, in: %w[FR SO JR SR], message: "must be a valid student class"
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  # API
  # before_create :generate_api_key
  #
  # def generate_api_key
  #   begin
  #     self.api_key = SecureRandom.hex
  #   end
  # end



  def name
    self.first_name + ' ' + self.last_name
  end

end
