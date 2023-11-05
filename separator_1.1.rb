module NumericSeparator
  # 数字にデリミタつけるよ! (文字列の数字はエラー返すよ)
  #
  # numberはデリミタつけたい数字 (RationalやComplexは無理だよ)
  #
  # digitsはデリミタを何桁ずつでつけるか
  # 例: (number:123456, digits:3) #=> 123,456
  #
  # digits_fは小数点以下何桁表示したいか(digit_f + 1桁目切り捨て)
  #
  # delimiterは整数部分のデリミタ
  #
  # delimiter_fは小数点以下部分のデリミタ(デフォルトはnil)
  #
  def separate_number(number:, digits: 3, digits_f: 6, delimiter: ',', delimiter_f: nil)
    raise ArgumentError, "Number must be a numeric value" unless number.is_a?(Numeric)
    raise ArgumentError, "Digits must be a positive integer" unless digits.is_a?(Integer) && digits > 0
    raise ArgumentError, "Digits_f must be a positive integer" unless digits_f.is_a?(Integer) && digits_f > 0

    int_part, frac_part = number.to_s.split(".")

    # 負の数のときにマイナスつける
    result = (number < 0 ? "-" : "") + int_separator(int_part, digits, delimiter)
    result += "." + float_separator(frac_part[0...digits_f], digits, delimiter_f) if frac_part

    result
  end

  def int_separator(int_part, digits, delimiter)
    return int_result = int_part.to_s.chars.reverse.each_slice(digits).map(&:join).join(delimiter).reverse
  end


  def float_separator(float_part, digits, delimiter)
    return float_result = float_part.to_s.chars.each_slice(digits).map(&:join).join(delimiter)
  end
end

