class ActivityCode < ActiveRecord::Base
  has_one :charity_association

  validates :name, :code, presence: true

  validates :code, numericality: { only_integer: true }
  validates :code, uniqueness: true
end
