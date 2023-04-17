class Monster
    ELEMENTS = [:FIRE, :WATER, :GRASS]

    def initialize(name, health, attack, defense, element)
        @name = name
        @health = health
        @attack = attack
        @defense = defense
        @element = element
    end

    def take_damage(amount)
        @health -= amount
    end

    def attack(target, isPrinting=false)
        if isPrinting then
            puts "Monster #{@name} deals #{@attack} damage to #{target.getName}"
        end
        target.take_damage(@attack)
    end

    def special_attack(target, isPrinting = false)
        if isPrinting then
            puts "Monster #{@name} makes special attack on #{target.getName}"
        end
    end

    def increaseAttack(amount)
        @attack += amount
    end

    def increaseDefense(amount)
        @defense += amount
    end

    def to_s
        "Name: #{@name} | Health: #{@health} |  Attack: #{@attack} |  Defense: #{@defense} | Element: #{@element}"
    end

    def isAlive
        @health > 0
    end

    def getName
        return @name
    end

    def getHealth
        return @health
    end

    def element
        return @element
    end
end

class FireMonster < Monster

    def initialize(name, health, attack, defense)
        super(name, health, attack, defense, :FIRE)
    end

   def special_attack(target, isPrinting = false)
        super(target, isPrinting)
        if target.element == :GRASS then
            target.take_damage(2 * @attack)
        elsif target.element == :WATER then
            target.take_damage(@attack/2)
        else 
            target.take_damage(@attack)
        end
   end

end

class WaterMonster < Monster
    def initialize(name, health, attack, defense)
        super(name, health, attack, defense, :WATER)
    end

    def special_attack(target, isPrinting = false)
        super(target, isPrinting)
        if target.element == :FIRE then
            target.take_damage(2 * @attack)
        elsif target.element == :GRASS then
            target.take_damage(@attack/2)
        else 
            target.take_damage(@attack)
        end
       end

end


class GrassMonster < Monster
    def initialize(name, health, attack, defense)
        super(name, health, attack, defense, :GRASS)
    end

    def special_attack(target, isPrinting = false)
        super(target, isPrinting)
        if target.element == :WATER then
            target.take_damage(2 * @attack)
        elsif target.element == :FIRE then
            target.take_damage(@attack/2)
        else 
            target.take_damage(@attack)
        end
       end

end

class Trainer
    def initialize(name)
        @name = name
        @monsters = []
    end

    def addMonster(monster)
        @monsters << monster
    end

    def removeMonster(monster)
        @monster.delete(monster)
    end

    def train_all
        attackAmountToIncrease = rand(1..10)
        defenseAmountToIncrease = rand(1..10)
        @monsters.each do |monster|
            monster.increaseDefense(attackAmountToIncrease)
            monster.increaseAttack(defenseAmountToIncrease)
        end
    end

    def getRandomMonster
        index = rand(0..@monsters.length-1)
        return @monsters[index]
    end

    def showMonsters()
        puts "Monsters of #{@name}"
        puts "----------------------------------------------"
        @monsters.each_with_index do |monster, index|
            puts "##{index+1} | #{monster}"
        end
    end
end

class Arena
    def initialize(name)
        @name = name
    end

    def fight(trainer1, trainer2)
        puts "New fight in #{@name} arena"
        puts "------------------------------------------"
        puts "The fighting monsters will be"
        puts "------------------------------------------"
        monster1 = trainer1.getRandomMonster
        puts "#1 #{monster1}"
        monster2 = trainer2.getRandomMonster
        puts "#2 #{monster2}"
        puts "----------------START--------------------------"
        round = 0
        while monster1.isAlive && monster2.isAlive
            puts "----------------ROUND #{round}------------------"
            whoIsAttacking = rand(1..2)
            willMakeSpecialAttack = rand(1..10)
            if whoIsAttacking == 1 then
                if willMakeSpecialAttack <= 2 then 
                    monster1.special_attack(monster2, true) 
                else 
                    monster1.attack(monster2, true)
                end
            else 
                if willMakeSpecialAttack <= 2 then 
                    monster2.special_attack(monster1, true)
                else 
                    monster2.attack(monster1,true)
                end
            end
            round += 1
        end
        puts "---------------END----------------"
        if monster2.isAlive then
            puts "Monster #{monster2.getName} with #{monster2.getHealth} hp remaining wins"
        else
            puts "Monster #{monster1.getName} #{monster1.getHealth} hp remainin wins"
        end

    end
end

#Available monsters
fireFlame = FireMonster.new("FireFlame", 100, 20, 20)
smeogle = WaterMonster.new("Smeogle", 100, 15, 18)

#Trainers
trainer1 = Trainer.new("Ash")
trainer2 = Trainer.new("Asta")

#MainFlow
trainer1.addMonster(fireFlame)
trainer2.addMonster(smeogle)

arena = Arena.new("TurdaCity")
arena.fight(trainer1, trainer2)