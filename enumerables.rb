# frozen_string_literal: true

module Enumerable
  def my_each
    (0...size).each do |i|
      yield self[i]
    end
  end

  def my_each_with_index
    (0...size).each do |i|
      yield self[i], i
    end
  end

  def my_select
    arr = []
    my_each { |val| arr << val if yield val }
    arr
  end
end

array = [5, 3, 7, 9, 2]

puts "\n> my_each"
array.my_each { |val| puts val }

puts "\n> my_each_with_index"
array.my_each_with_index { |val, index| puts "#{index} => #{val}" }

puts "\n> my_select"
puts(array.my_select { |val| val > 3 })
