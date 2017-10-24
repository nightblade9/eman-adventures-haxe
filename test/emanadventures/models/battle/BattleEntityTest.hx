package emanadventures.models.battle;

import haxesharp.exceptions.ArgumentException;
using haxesharp.test.Assert;

class BattleEntityTest
{
    @Test
    public function constructorThrowsIfHealthIsNonPositive()
    {
        Assert.throws(ArgumentException, function() { new BattleEntity(0, 10); });
        Assert.throws(ArgumentException, function() { new BattleEntity(-5, 10); });
    }

    @Test 
    public function constructorThrowsIfAgilityIsNonPositive()
    {
        Assert.throws(ArgumentException, function() { new BattleEntity(100, -10); });
        Assert.throws(ArgumentException, function() { new BattleEntity(100, -0); });
    }

    @Test
    public function currentHealthReturnsConstructorSpecifiedValue()
    {

    }

    @Test
    public function totalHealthReturnsConstructorSpecifiedValue()
    {

    }
}