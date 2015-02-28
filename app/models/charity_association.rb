class CharityAssociation < ActiveRecord::Base
  has_one :activity_code

  validates :name, :nif, :city, presence: true

  validates :nif, numericality: { only_integer: true }
  validates :nif, uniqueness: true
end
