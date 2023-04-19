
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
            puts "Monster #{monster2.name} with #{monster2.health} hp remaining wins"
        else
            puts "Monster #{monster1.name} #{monster1.health} hp remainin wins"
        end

    end
end