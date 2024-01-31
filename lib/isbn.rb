class Isbn
  def initialize(isbn12:)
    raise ArgumentError.new("isbn12 is invalid") if isbn12.length != 12

    @isbn12 = isbn12
  end

  def check_digit
    result = 0
    @isbn12.split('').each_with_index do |value, index|
      m = index % 2 == 0 ? 1 : 3
      result += value.to_i * m
    end

    result %= 10
    return 0 if result == 0

    10 - result
  end
end
