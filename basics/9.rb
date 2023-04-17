for a in 1..5000
    for b in 1..5000
        c = Math.sqrt(a*a+b*b)
        if c == c.to_i then
            if a+b+c == 1000 then
                puts a*b*c
                exit
            end
        end
    end
end