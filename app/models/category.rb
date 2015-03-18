class Category < ActiveRecord::Base
  has_many :activity_codes

  validates :name, presence: true
end
