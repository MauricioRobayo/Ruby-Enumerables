# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < size
      yield self[i], i
      i += 1
    end
  end
end

array = [5, 3, 7, 9, 2]

puts '=== my_each ==='
array.my_each { |val| puts val }

puts '=== my_each_with_index ==='
array.my_each_with_index { |val, index| puts "#{index} => #{val}" }
