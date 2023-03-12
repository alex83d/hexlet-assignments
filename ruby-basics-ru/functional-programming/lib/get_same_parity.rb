# frozen_string_literal: true

# BEGIN
def get_same_parity(list)
  list.reduce([]) { |result, i| i.even? == list.first.even? ? result << i : result }
end
# END
