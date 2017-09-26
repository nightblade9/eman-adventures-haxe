package emanadventures.model;

import massive.munit.Assert;

class WorldTest
{
    @Test
    public function constructorSetsSpecifiedSeed()
    {
        var world = new World(12345);
        Assert.isTrue(world.seed == 12345);
    }

    @Test
    public function constructorGeneratesSeedIfNotSpecified()
    {
        var w1 = new World();
        var w2 = new World();
        Assert.isTrue(w1.seed != null);
        Assert.isTrue(w1.seed != null);
        Assert.isTrue(w1.seed != w2.seed);
    }
}