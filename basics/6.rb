sum1 = 0
1.upto(100) do |i|
    sum1 += i*i
end

sum2 = (100*101)/2

puts sum2*sum2 - sum1
