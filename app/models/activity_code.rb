class ActivityCode < ApplicationRecord
  has_one :charity_association
  belongs_to :category

  validates :name, presence: true

  validates :code, numericality: { only_integer: true }
  validates :code, :name, uniqueness: true
end
