class ActivityCode < ActiveRecord::Base
  has_one :charity_association

  validates :name, presence: true

  validates :code, numericality: { only_integer: true }
  validates :code, :name, uniqueness: true
end
