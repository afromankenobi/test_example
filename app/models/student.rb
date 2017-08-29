class Student < Member
  # STI on rails :)
  has_many :evaluations
end
