# frozen_string_literal: true

require_relative 'my_enumerables.rb'

array = [5, 3, 7, 9, 5]

puts "\n> my_each"
puts "array => #{array}"
array.my_each { |val| puts val }

puts "\n> my_each_with_index"
puts "array => #{array}"
array.my_each_with_index { |val, index| puts "#{index} => #{val}" }

puts "\n> my_select"
puts "array => #{array}"
puts(array.my_select { |val| val > 3 })

puts "\n> my_all?"
puts "array => #{array}"
puts(array.my_all? { |val| val > 1 })

puts "\n> my_any?"
puts "array => #{array}"
puts(array.my_any? { |val| val > 8 })

puts "\n> my_none?"
puts "array => #{array}"
puts(array.my_none?(&:even?))

puts "\n> my_count"
puts "array => #{array}"
puts(array.my_count { |val| val == 5 })
puts array.my_count(&:odd?)
puts array.my_count(&:even?)
puts array.my_count

puts "\n> my_map"
puts "array => #{array}"
puts "result with block => #{array.my_map { |val| val * 2 }}"
double = proc { |val| val * 2 }
puts "result with proc => #{array.my_map(double)}"

puts "\n> my_inject"
puts "array => #{array}"
puts "result => #{array.my_inject(&:+)}"
puts "result => #{array.my_inject(&:*)}"
puts "result => #{array.my_inject { |acc, val| "#{acc} #{val}" }}"
puts "result => #{array.my_inject('hi') { |acc, val| "#{acc} #{val}" }}"
