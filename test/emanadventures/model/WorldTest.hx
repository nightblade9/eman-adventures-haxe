package emanadventures.model;

import emanadventures.math.SeededRandom;

import haxesharp.test.Assert;

class WorldTest
{
    @Test
    public function constructorSetsSpecifiedSeed()
    {
        var expectedSeed = 12345;
        var actual = new World(expectedSeed);
        Assert.that(actual.seed, Is.equalTo(expectedSeed));
    }

    @Test
    public function constructorGeneratesSeedIfNotSpecified()
    {
        var w1 = new World();
        var w2 = new World();
        Assert.that(w1.seed, Is.not(null));
        Assert.that(w2.seed, Is.not(null));
        Assert.that(w1.seed, Is.not(w2.seed));
    }

    @Test
    public function constructorCreatesSeededRandom()
    {
        Assert.that(SeededRandom.lastInstance, Is.equalTo(null));
        var world = new World();
        Assert.that(SeededRandom.lastInstance, Is.not(null));
    }
}