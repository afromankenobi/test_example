# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Member.destroy_all
Course.destroy_all
Participation.destroy_all
Test.destroy_all
Evaluation.destroy_all

20.times do
  Member.create(
    name: Faker::Name.name,
    type: %w[Teacher Student].sample
  )
end

5.times do
  Course.create(
    name: Faker::Educator.course
  )
end

Member.order('RANDOM()').each do |member|
  member.courses << Course.order('RANDOM()').limit(3)
end

Course.all.each do |course|
  3.times do |i|
    course.tests.create(
      content: "test #{i} for #{course.name}"
    )
  end
end

Student.order('RANDOM()').each do |student|
  Test.order('RANDOM()').each do |test|
    Evaluation.create(
      member: student,
      test: test,
      score: rand(1.0..7.0).round(1)
    )
  end
end
