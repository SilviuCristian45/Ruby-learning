#!/usr/bin/ruby

character_name = "Silviu"

puts "hello " + character_name.length().to_s

puts "Hello world"

data = "Tiger,Great White,Hammerhead,Whale,Bullhead"

# Convert data to an array by splitting on commas
sharks = data.split(",")

# Sort the sharks alphabetically
if ! sharks.nil? 
    sharks = sharks.sort
end

# Print out the sharks by iterating through the array
sharks.each{|shark| puts shark }

names = Array.new(20, "")
puts "#{names}"