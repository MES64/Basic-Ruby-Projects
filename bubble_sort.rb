# frozen_string_literal: true

def bubble_sort(array)
  n = array.length
  until n <= 1
    new_n = 0
    (1...n).each do |idx|
      new_n = swap_and_update_new_n(array, idx) if array[idx] < array[idx - 1]
    end
    n = new_n
  end
  array
end

def swap_and_update_new_n(array, idx)
  array[idx], array[idx - 1] = array[idx - 1], array[idx]
  idx
end

array = [4, 3, 78, 2, 0, 2]
p bubble_sort(array) # => [0, 2, 2, 3, 4, 78]
p array # => [0, 2, 2, 3, 4, 78] -> It also affects the original array

p bubble_sort([]) # => []
p bubble_sort([5, 4, 3, 2, 1])  # => [1,2,3,4,5]
p bubble_sort([1, 2, 3, 4, 5])  # => [1,2,3,4,5]
