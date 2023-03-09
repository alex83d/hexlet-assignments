# frozen_string_literal: true

def fizz_buzz(start, stop)
  result = ""
  if start <= stop
    (start..stop).each do |num|
      result += if (num % 3).zero? && (num % 5).zero?
          "FizzBuzz "
        elsif (num % 3).zero?
          "Fizz "
        elsif (num % 5).zero?
          "Buzz "
        else
          "#{num} "
        end
    end
  else result = nil   end
  (!result.nil?) ? result.strip : result
end
