package emanadventures.model;

/**
 * A "World" model class. Contains all the data sufficient to construct the entire
 * game world, including the plot, characters, events, items, maps, etc. -- all data.
 * The actual presentation view (FlxState subclasses) can simply render and control.
 */
class World
{
    public var seed(default, null):Int;
    private static inline var MaxInt:Int = 2147483647; // 2^31 - 1

    public function new(?seed:Int)
    {
        if (seed != null)
        {
            this.seed = seed;            
        }
        else
        {
            // TODO: convert to Random class, NextInt method
            this.seed = Math.floor(Math.random() * MaxInt);
        }
    }
}