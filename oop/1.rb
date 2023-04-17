class Person
  attr_accessor :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def introduce
    puts "Hi, my name is #{@name} and I'm #{@age} years old."
  end
end

class Vehicle
  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year    
  end

  def description
    puts "Vehicle #{@make} and model: #{@model} and year: #{@year}"
  end
end

person = Person.new("Silviu", 23)
person.introduce

m = Vehicle.new("Maker","Logan","2023")
m.description

class BankAccount
  def initialize(balance, owner)
    @balance = balance
    @owner = owner
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def status
    puts "account status : #{@balance} $ and owner: #{@owner}"
  end

end

b1 = BankAccount.new(20, "Silviu")
b1.status
b1.deposit(50)
b1.status
b1.withdraw(50)
b1.status
