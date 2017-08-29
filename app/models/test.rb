class Test < ApplicationRecord
  belongs_to :course, optional: true
end
