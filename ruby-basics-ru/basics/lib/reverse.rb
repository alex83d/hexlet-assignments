# frozen_string_literal: true

# BEGIN
  def reverse(str)
    i = str.size - 1
    result = ''
    while i >= 0
      result += str[i]
      i -= 1
    end
    result
  end
# END
