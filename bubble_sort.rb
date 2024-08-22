def bubble_sort(array)
  n = array.length
  until n <= 1
    new_n = 0
    for i in (1...n)
      if array[i] < array[i-1]
        array[i], array[i-1] = array[i-1], array[i]
        new_n = i
      end
    end
    n = new_n
  end
  array
end

array = [4,3,78,2,0,2]
p bubble_sort(array)  # => [0, 2, 2, 3, 4, 78]
p array  # => [0, 2, 2, 3, 4, 78] -> It also affects the original array