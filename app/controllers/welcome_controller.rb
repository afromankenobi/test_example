class WelcomeController < ApplicationController
  def index; end

  def factorial
    numbers = 10.downto(1).map { rand(1..100) }

    # Build a hash for the numbers
    @factorial_examples = numbers.each_with_object({}) do |number, total|
      fact = number.factorial
      total[number.to_s] = {
        factorial: fact,
        number_of_zeros: fact.count_end_zeros
      }
      # return an updated hash each iteration
      total
    end
  end

  def number_to_words
    to_words_numbers = Array.new(10) do
      rand(-9_999_999_999_999_999_999..9_999_999_999_999_999_999)
    end

    @to_words_examples = to_words_numbers.map do |num|
      {
        number: num,
        to_words: num.to_words
      }
    end
  end
end
