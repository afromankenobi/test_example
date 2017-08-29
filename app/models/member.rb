class Member < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :courses, through: :participations

  TYPES = %w[Student Teacher].freeze

  validates :type, inclusion: { in: TYPES }

  def to_s
    name.titleize
  end
end
