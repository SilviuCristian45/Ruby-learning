class Monster
    @@ELEMENTS = [:FIRE, :WATER, :GRASS]
    attr_accessor :name, :health, :attack, :defense, :element

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
            puts "Monster #{@name} deals #{@attack} damage to #{target.name}"
        end
        target.take_damage(@attack)
    end

    def special_attack(target, isPrinting = false)
        if isPrinting then
            puts "Monster #{@name} makes special attack on #{target.name}"
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
end