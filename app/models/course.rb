class Course < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :members, through: :participations
  has_many :tests
end
