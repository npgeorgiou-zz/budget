class Numeric

  # Format 1234.1234 => 1.124,12
  def format_float_to_string_of_my_liking
    # Round to 2 decimals places
    numeric = self.round(2)

    # Put thousands separator to amounts
    value_to_s = numeric.to_s
    value_to_s = value_to_s.gsub('.', ',').gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1.")

    # Add another 0 in end of decimal if only one decimal place
    value_to_s = value_to_s.split(',')[1].length === 1 ? value_to_s + '0' : value_to_s

    return value_to_s
  end

end