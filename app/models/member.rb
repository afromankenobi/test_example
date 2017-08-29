class Member < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :courses, through: :participations
end
