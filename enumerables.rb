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

  def my_all?
    my_each { |val| return false unless yield val }
    true
  end

  def my_any?
    my_each { |val| return true if yield(val) }
    false
  end

  def my_none?
    my_each { |val| return false if yield val }
    true
  end
end

array = [5, 3, 7, 9, 2]

puts "\n> my_each"
array.my_each { |val| puts val }

puts "\n> my_each_with_index"
array.my_each_with_index { |val, index| puts "#{index} => #{val}" }

puts "\n> my_select"
puts(array.my_select { |val| val > 3 })

puts "\n> my_all?"
puts(array.my_all? { |val| val > 1 })

puts "\n> my_any?"
puts(array.my_any? { |val| val > 8 })

puts "\n> my_none?"
puts(array.my_none?(&:even?))
