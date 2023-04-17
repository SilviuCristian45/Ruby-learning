require 'prime'

number = 2
counter = 1 #counter of prime numbers

while counter <= 10001
    if Prime.prime?(number) then
        counter += 1 
    end
    number += 1
end

puts number-1