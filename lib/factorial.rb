# Extend Integer class to add factorial related methods
class Integer
  # Iterative factorial
  def factorial
    # fail if this is called by negative numbers
    raise ArgumentError, 'Not valid for negative numbers' if self < 0
    return 1 if zero?

    # iterates backwards and inject * to the acumulator
    downto(1).inject(:*)
  end

  # Each time we divide the number on 5 we will sum 1 to the trailing zeros
  def count_end_zeros
    return 1 if zero?
    (self % 5).zero? ? 1 + (self / 5).count_end_zeros : 0
  end
end
