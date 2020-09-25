



fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#A very hungry octopus wants to eat the longest fish in an array of fish

def sluggish_octopus(arr) #finding the longest fish in O(n^2) time
    longest_fish = ""
    arr.each do |fish|
        arr.each do |fish2|
            longest_fish = fish2 if fish2.length >= fish.length && fish2.length >= longest_fish.length
        end
    end
    longest_fish
end

puts sluggish_octopus(fish)

def dominant_octopus(arr) #returns the first largest fish in sorted array in O(n log n) time
    largest_fish = octo_merge_sort(arr)
    largest_fish[0]
end

def octo_merge_sort(arr) #sorting fishes using merge sort
    return arr if arr.length < 2
    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle..-1]
    sorted_left = octo_merge_sort(left)
    sorted_right = octo_merge_sort(right)
    octo_merge(sorted_left, sorted_right)
end

def octo_merge(left, right) #merge for merge sort
    sorted_arr = []
    until left.empty? || right.empty?
        if left[0].length < right.length
            sorted_arr << left.shift
        else
            sorted_arr << right.shift
        end
    end
    sorted_arr + left + right
end

puts dominant_octopus(fish)

def clever_octopus(arr) #returns the largest fish in O(n) time.
    largest_fish = arr[0]
    arr.each do |fish|
        largest_fish = fish if fish.length > largest_fish.length
    end
    largest_fish
end

puts clever_octopus(fish)


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#Full of fish, the Octopus attempts Dance Dance Revolution

def slow_dance(direction, array)
    array.each_with_index do |dir, index|
        return index if dir == direction
    end
end

puts slow_dance("up", tiles_array)
puts slow_dance("right-down", tiles_array)

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" =>4, "left-down" => 5, "left" => 6,  "left-up" => 7}
def fast_dance(direction, hash) #using a different data structure and write a function that can access the tentacle number in O(1) time
    return hash[direction] if hash.keys.include?(direction)
end

puts fast_dance("up", tiles_hash)
puts fast_dance("right-down", tiles_hash)