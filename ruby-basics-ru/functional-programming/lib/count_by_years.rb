# frozen_string_literal: true

# BEGIN
def count_by_years(arr)
  require 'time'
  res = {}
  d = arr.filter { |u| (u[:gender] == 'male') }
         .map { |v| { year: Time.parse(v[:birthday]).strftime('%Y') } }
         .group_by { |u| u[:year] }

  d.each do |x, y|
    sum = 1
    y.each_with_index { |_a, b| sum = b + 1 }
    res[x] = sum
  end
  res
end
# END
