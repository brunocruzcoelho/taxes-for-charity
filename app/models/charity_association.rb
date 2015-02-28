class CharityAssociation < ActiveRecord::Base
  belongs_to :activity_code

  validates :name, :nif, :city, presence: true

  validates :nif, numericality: { only_integer: true }
  validates :nif, uniqueness: true
end
