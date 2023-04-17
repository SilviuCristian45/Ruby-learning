class String
    def palindrome?
      self == self.reverse
    end
  end

class Numeric
    def palindrome?
        self.to_s.palindrome?
    end
end

res = 0
999.downto(100).each { |num1| 
    999.downto(100).each { |num3| 
        product = (num1 * num3)
        if product.palindrome?
            res = [res, product].max
        end
    }
}
puts res