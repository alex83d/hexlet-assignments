# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  cens = '$#%!'
  text.split(' ')
      .map { |word| stop_words.include?(word) ? cens : word }.join(' ')
  # END
end
