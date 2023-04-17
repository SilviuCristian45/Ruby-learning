require 'prime'
sum = 0
Prime.each(2_000_000) do |prime|
    sum += prime  #=> 2, 3, 5, 7, 11, ...., 97
end
puts sum