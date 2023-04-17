number = 600851475143
d = 2
factors = Array.new

while number > 1
    if number % d == 0
        factors.append(d)
    end
    while number % d == 0
        number = number/d
    end
    d+=1
end

puts "#{factors.max()}"