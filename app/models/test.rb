class Test < ApplicationRecord
  belongs_to :course, optional: true

  def to_s
    id.to_s
  end
end
