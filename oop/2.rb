require './Monster'
require './FireMonster'
require './GrassMonster'
require './WaterMonster'
require './Trainer'
require './Arena'
require './DataReader'

dataReaderMonsters = DataReader.new("monsters.json")
monsters = dataReaderMonsters.readData("monsters")

dataReaderTrainers = DataReader.new("trainers.json")
trainers = dataReaderTrainers.readData("trainers")

#Trainers
trainer1 = trainers[0]
trainer2 = trainers[1]

arena = Arena.new("TurdaCity")
arena.fight(trainer1, trainer2)