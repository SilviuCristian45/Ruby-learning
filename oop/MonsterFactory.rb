require_relative 'FireMonster'

class MonsterFactory
    def self.createMonster(name, health, attack, defense, type)
        case type
        when "Fire"
            return FireMonster.new(name, health, attack, defense)
        when  "Water"
            return WaterMonster.new(name, health, attack, defense)
        when "Grass"
            return GrassMonster.new(name, health, attack, defense)
        end
    end
end