package emanadventures.models.battle;

import haxesharp.exceptions.ArgumentException;
using haxesharp.test.Assert;

class TurnCalculatorTest
{
    @Test
    public function constructorThrowsIfEntitiesAreNullOrEmpty()
    {
        Assert.throws(ArgumentException, function() { new TurnCalculator(null); });
        Assert.throws(ArgumentException, function() { new TurnCalculator( [] ); });
    }

    @Test
    public function calculateNextTurnGetsFastestEntity()
    {
        var player = new AgileEntity(7);
        var slime = new AgileEntity(3);

        var tc = new TurnCalculator([player, slime]);
        var actual = tc.calculateNextTurn();
        Assert.that(actual, Is.equalTo(player));
    }
}

private class AgileEntity implements IBattleEntity
{
    public var agility(default, null):Int;

    public function new(agility:Int)
    {
        this.agility = agility;
    }
}