# frozen_string_literal: true

module Enumerable
  def my_each
    for val in self
      yield val
    end
  end

  def my_each_with_index
    (0...size).my_each do |i|
      yield self[i], i
    end
  end

  def my_select
    [].tap { |arr| my_each { |val| arr << val if yield val } }
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
      my_each { count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    [].tap { |arr| my_each { |val| arr << (proc ? proc[val] : yield(val)) } }
  end

  def my_inject(acc = nil)
    if acc
      rest = self
    else
      acc, *rest = self
    end
    rest.my_each { |val| acc = yield acc, val }
    acc
  end
end
