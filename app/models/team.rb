class Team < ApplicationRecord
  GENDERS = [ ['Men', 'men'], ['Women', 'women'] ]
  SEASONS = [ ['Fall', 'fall'], ['Winter', 'winter'], ['Spring', 'spring'] ]

  # Relations
  has_many :users

  # Scopes
  scope :for_sport, ->(sportName) { where(name: sportName) }
  scope :order_name, -> {order(:name)}


  # Validations
  validates_presence_of :gender, :name, :season
  validates_inclusion_of :gender, in: GENDERS.map{|key, value| key}, message: "is not an option"



end
