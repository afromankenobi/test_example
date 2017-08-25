# Extend the integer class
class Integer
  # each group represents positions splitted by 6
  # for each group, we need to
  # locate the period
  # for each period, locate the two classes
  # then add classes name (left to right) name
  # add period
  # add hundreds
  # according to the long numeric scale:
  # https://es.wikipedia.org/wiki/Escalas_num%C3%A9ricas_larga_y_corta

  PERIODS = %w[
    -
    -
    millon
    -
    billon
    -
    trillon
    -
    cuatrillon
    -
    quintillon
    -
    sextillon
    -
    septillon
    -
    octillon
    -
    nonillon
  ].freeze
  FIRST_PERIOD = 'un'.freeze

  CLASSES = 'mil'.freeze

  # used to pluralize big numbers (> 1000)
  BIG_PLURAL = 'es'.freeze

  HUNDREDS = %w[
    - cien doscientos trescientos cuatrocientos
    quinientos seiscientos setecientos ochocientos novecientos
  ].freeze
  # Used to pluralize one hundred (cien -> ciento)
  HUNDRED_PLURAL = 'to'.freeze

  TENS = %w[
    - - veinte treinta cuarenta cincuenta
    sesenta setenta ochenta noventa
  ].freeze
  TENS_CONNECTOR = ' y '.freeze

  FIRSTS = %w[
    cero uno dos tres cuatro cinco seis siete ocho
    nueve diez once doce trece catorce quince dieciseis
    diecisiete dieciocho diecinueve
  ].freeze

  def handle_firsts(cut_one = false)
    # uno should be un when more numbers come to the right
    return 'un' if self == 1 && cut_one == true
    FIRSTS[self]
  end

  def handle_tens(cut_one = false)
    return handle_firsts(cut_one) if self < 20

    ten, unit = divmod(10)
    unit.zero? ? TENS[ten] : "#{TENS[ten]} y #{unit.handle_firsts(cut_one)}"
  end

  def handle_hundreds(cut_one = false)
    hundred, tens = divmod(100)
    if tens.zero?
      HUNDREDS[hundred]
    elsif hundred == 1
      [HUNDREDS[hundred] + HUNDRED_PLURAL, tens.handle_tens(cut_one)].join(' ')
    else
      [HUNDREDS[hundred], tens.handle_tens(cut_one)].join(' ')
    end
  end

  def words_for_classes(cut_one = false)
    return handle_firsts(cut_one) if self < 19
    return handle_tens(cut_one) if self < 100

    handle_hundreds(cut_one) if self < 1000
  end

  def periods_words(number, i, cut_one = false)
    return [FIRST_PERIOD, PERIODS[i]].join(' ') if number == 1
    [number.words_for_classes(cut_one), PERIODS[i] + BIG_PLURAL].join(' ')
  end

  # 1_243_961_782 -> 782, 961, 243, 1
  def in_groups
    to_s.reverse.scan(/.{1,3}/).map(&:reverse)
  end

  def classes_words(number, cut_one)
    return CLASSES if number == 1

    "#{number.words_for_classes(cut_one)} #{CLASSES}"
  end

  # each odd index means is the second class and should have the mil word
  # each even index is a million, and should says million, billion, etc
  def convert_group(number, i, cut_one)
    return number.words_for_classes if i.zero?
    return classes_words(number, cut_one) if i.odd?
    periods_words(number, i, cut_one) if i.even?
  end

  # Each number can be divided on groups of 6 digits, that is called period
  # Each period can be divided on groups of 3 digits. This's called Class
  def to_words
    groups = in_groups
    words = []
    groups.each_with_index do |group, index|
      next if group.to_i.zero? && groups.count > 1
      cut_one = index > 0
      words << convert_group(group.to_i, index, cut_one)
    end

    words.reverse.join(' ')
  end
end
