# Extend Integer class to add factorial related methods
class Integer
  def factorial
    # fail if this is called by negative numbers
    raise ArgumentError, 'Not valid for negative numbers' if self < 0
    return 1 if zero?

    downto(1).inject(:*)
  end
end
