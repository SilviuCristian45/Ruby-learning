
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