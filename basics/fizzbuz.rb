Array(1..100).each { |number| 
    if number % 3 == 0 && number % 5 == 0
        print "FizzBuzz "
        next
    end
    if number % 5 == 0
        print "Buzz "
        next
    end
    if number % 3 == 0 
        print "Fizz "
    next
    end 
    print number.to_s + " "
}

