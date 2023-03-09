# frozen_string_literal: true

# BEGIN

def compare_versions(ver1, ver2)
  arr1, arr2 = ver1.split('.'), ver2.split('.')
  arr1, arr2 = arr1.zip([0] * (arr2.length - arr1.length))
                   .flatten, arr2.zip([0] * (arr1.length - arr2.length)).flatten
  (0...arr1.length).each { |i| return arr1[i].to_i <=> arr2[i].to_i if arr1[i].to_i != arr2[i].to_i }
  0
end

# END
