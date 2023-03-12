# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, list)
  word_sorted = word.chars.sort.join

  list.select do |elem|
    elem.chars.sort.join == word_sorted
  end
end

# END
