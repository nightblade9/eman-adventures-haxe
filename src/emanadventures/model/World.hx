package emanadventures.model;

import emanadventures.math.SeededRandom;
import haxesharp.random.Random;

/**
 * A "World" model class. Contains all the data sufficient to construct the entire
 * game world, including the plot, characters, events, items, maps, etc. -- all data.
 * The actual presentation view (FlxState subclasses) can simply render and control.
 */
class World
{
    public var seed(default, null):Int;
    private var storyTemplate:StoryTemplate;
    private var seededRandom:SeededRandom;

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

        this.seededRandom = new SeededRandom(this.seed);
    }
}