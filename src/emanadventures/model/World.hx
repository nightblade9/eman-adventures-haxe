package emanadventures.model;

import haxesharp.random.Random;

/**
 * A "World" model class. Contains all the data sufficient to construct the entire
 * game world, including the plot, characters, events, items, maps, etc. -- all data.
 * The actual presentation view (FlxState subclasses) can simply render and control.
 */
class World
{
    public var seed(default, null):Int;

    public function new(?seed:Int)
    {
        if (seed != null)
        {
            this.seed = seed;            
        }
        else
        {
            this.seed = new Random().next();
        }
    }
}