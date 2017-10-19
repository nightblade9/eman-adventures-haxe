package emanadventures.models;

import emanadventures.models.MapArea;
import emanadventures.models.templates.StoryTemplate;
import haxesharp.random.Random;

/**
 * A "World" model class. Contains all the data sufficient to construct the entire
 * game world, including the plot, characters, events, items, maps, etc. -- all data.
 * The actual presentation view (FlxState subclasses) can simply render and control.
 */
class World
{
    public static var lastInstance(default, null):World;

    public var seed(default, null):Int;
    public var mapAreas(default, null):Array<MapArea> =
    [
        new MapArea("Silver Forest", 0xFF999999, true),
        new MapArea("Ice Temple", 0xFFaaccee),
        new MapArea("Cave", 0xFF553311)
    ];

    private var storyTemplate:StoryTemplate;
    private var seededRandom:Random;

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

        this.seededRandom = new Random(this.seed);
        this.storyTemplate = StoryTemplate.generate(this.seededRandom);
        World.lastInstance = this;
    }
}