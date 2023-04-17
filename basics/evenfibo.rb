limit = 4000000

t1 = 1
t2 = 1
res = 0

while t2 <= limit

    tnew = t2+t1
    t1 = t2
    t2 = tnew

    if tnew % 2 == 0
        res += tnew
    end

end

puts res