
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