class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_one :uber, dependent: :destroy
end
