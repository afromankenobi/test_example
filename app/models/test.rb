class Test < ApplicationRecord
  belongs_to :course, optional: true

  def to_s
    content.titleize
  end
end
