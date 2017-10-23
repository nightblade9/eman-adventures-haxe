package emanadventures.models.battle;

using haxesharp.test.Assert;

class TurnCalculatorTest
{
    @Test
    public function calculateNextTurnGetsFastestEntity():Void
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