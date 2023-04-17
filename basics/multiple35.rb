sum = 0
Array(1..999).each { |number| 
    if number % 3 == 0 || number % 5 == 0
        sum += number
    end
}
puts sum

