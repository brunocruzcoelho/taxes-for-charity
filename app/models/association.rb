class Association < ActiveRecord::Base
  validates :name, :nif, :city, presence: true

  validates :nif, numericality: { only_integer: true }
  validates :nif, uniqueness: true
end
