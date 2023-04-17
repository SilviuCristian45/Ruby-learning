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

    def attack(target)
        target.take_damage(@attack)
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

    def isAlive?
        @health != 0
    end

    def getName
        return @name
    end
end

class FireMonster < Monster

    def initialize(name, health, attack, defense)
        super(name, health, attack, defense, :FIRE)
    end

   def special_attack(target)
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

    def special_attack(target)
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

    def special_attack(target)
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
        index = rand(0..@monsters.length)
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
        while monster1.isAlive && monster2.isAlive
            whoIsAttacking = rand(1..2)
            if whoIsAttacking then 
                monster1.attack(monster2)
            else 
                monster2.attack(monster1)
            end
        end
    end
end

#Available monsters
fireFlame = FireMonster.new("FireFlame", 100, 20, 20)
smeogle = FireMonster.new("Smeogle", 100, 15, 18)

#Trainers
trainer1 = Trainer.new("Ash")
trainer2 = Trainer.new("Asta")

#MainFlow
trainer1.addMonster(fireFlame)
trainer2.addMonster(smeogle)

arena = Arena.new("TurdaCity")
