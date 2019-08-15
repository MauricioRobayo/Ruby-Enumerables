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
    my_each { |val| return true if yield val }
    false
  end

  def my_none?
    my_each { |val| return false if yield val }
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |val| count += 1 if yield val }
    else
      my_each { |val| count += 1 }
    end
    count
  end

  def my_map
    my_each_with_index { |val, index| self[index] = yield val }
    self
  end
end

array = [5, 3, 7, 9, 5]

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

puts "\n> my_count"
puts(array.my_count { |val| val == 5 })
puts array.my_count(&:odd?)
puts array.my_count(&:even?)
puts array.my_count

puts "\n> my_map"
puts "array => #{array}"
puts "result => #{array.my_map { |val| val * 2 }}"
