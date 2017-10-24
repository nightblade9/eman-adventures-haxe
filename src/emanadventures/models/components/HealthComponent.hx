package emanadventures.models.components;

import haxesharp.exceptions.ArgumentException;

// In the spirit of Single Responsibility, small well-defined classes make sense.
// TODO: unit tests.

class HealthComponent
{
    public var currentHealth(default, default):Int;
    public var totalHealth(default, null):Int;

    public function new(totalHealth:Int)
    {
        if (totalHealth <= 0)
        {
            throw new ArgumentException("Health must be positive");
        }
        this.currentHealth = this.totalHealth = totalHealth;
    }

    public function getHurt(damage:Int)
    {
        if (damage > 0)
        {
            this.currentHealth -= damage;
        }
    }

    public function isAlive():Bool
    {
        return this.currentHealth > 0;
    }
}