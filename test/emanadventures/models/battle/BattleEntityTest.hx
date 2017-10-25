package emanadventures.models.battle;

import haxesharp.exceptions.ArgumentException;
using haxesharp.test.Assert;

class BattleEntityTest
{
    @Test
    public function constructorThrowsIfHealthIsNonPositive()
    {
        Assert.throws(ArgumentException, (_) => new BattleEntity(0, 10));
        Assert.throws(ArgumentException, (_) => new BattleEntity(-5, 10));
    }

    @Test 
    public function constructorThrowsIfAgilityIsNonPositive()
    {
        Assert.throws(ArgumentException, (_) => new BattleEntity(100, -10));
        Assert.throws(ArgumentException, (_) => new BattleEntity(100, -0));
    }

    @Test
    public function currentAndTotalHealthReturnConstructorSpecifiedValue()
    {
        var b = new BattleEntity(50, 1);
        Assert.that(b.currentHealth, Is.equalTo(50));
        Assert.that(b.totalHealth, Is.equalTo(50));
    }
}