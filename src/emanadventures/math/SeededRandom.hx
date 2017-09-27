package emanadventures.math;

import de.polygonal.core.math.random.ParkMiller;

/**
An abstraction over our current choice of seeded PRNG.
Also provides singleton-like functionality to get the latest instance.
**/
class SeededRandom
{
    public static var lastInstance(default, null):SeededRandom;
    private var randomGenerator:ParkMiller;

    public function new(seed:Int)
    {
        SeededRandom.lastInstance = this;
        this.randomGenerator = new ParkMiller(seed);
    }
}