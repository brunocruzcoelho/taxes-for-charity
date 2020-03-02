class Category < ApplicationRecord
  has_many :activity_codes

  validates :name, presence: true
end
