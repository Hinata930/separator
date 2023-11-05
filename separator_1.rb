# 整数部分にデリミタつけるよ! digits_fは小数点以下の桁数だよ 溢れたら切り捨てだよ
def separate_number(number, digits, digits_f, delimiter)
  raise ArgumentError, "Number must be a numeric value" unless number.is_a?(Numeric)
  raise ArgumentError, "Digits must be a positive integer" unless digits.is_a?(Integer) && digits > 0

  int_part, frac_part = number.to_s.split(".")

  result = (number < 0 ? "-" : "") + int_separator(int_part, digits, delimiter)
  result += "." + frac_part[0...digits_f] if frac_part

  result
end

def int_separator(int_part, digits, delimiter)
  int_result = int_part.to_s.chars.reverse.each_slice(digits).map(&:join).join(delimiter).reverse
end