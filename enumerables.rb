# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield self[i]
      i += 1
    end
  end
end

array = [5, 3, 7, 9, 2]
array.my_each { |val| puts val }
