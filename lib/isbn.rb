class Isbn
  def initialize(prefix12:)
    raise ArgumentError.new("prefix12 is invalid") if prefix12.length != 12

    @prefix12 = prefix12
  end

  def check_digit
    result = 0
    @prefix12.split('').each_with_index do |value, index|
      m = index % 2 == 0 ? 1 : 3
      result += value.to_i * m
    end

    result %= 10
    return 0 if result == 0

    10 - result
  end
end
