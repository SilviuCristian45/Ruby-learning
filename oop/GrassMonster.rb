
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
