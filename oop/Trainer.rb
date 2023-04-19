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

    def to_s
        puts "Trainer #{@name}"
    end
end