package emanadventures.models.battle;

import emanadventures.models.components.HealthComponent;
import haxesharp.exceptions.ArgumentException;

class BattleEntity // TODO: implements IBattleEntity
{
    public var agility(default, null):Int;
    public var currentHealth(get, null):Int;
    public var totalHealth(get, null):Int;

    private var health:HealthComponent;

    public function new(totalHealth:Int, agility:Int)
    {
        if (totalHealth <= 0)
        {
            throw new ArgumentException("Health must be positive");
        }

        if (agility <= 0)
        {
            throw new ArgumentException("Agility must be positive");
        }

        this.agility = agility;
        this.health = new HealthComponent(totalHealth);
    }

    private function get_currentHealth():Int
    {
        return this.health.currentHealth;
    }

    private function get_totalHealth():Int
    {
        return this.health.totalHealth;
    }
}