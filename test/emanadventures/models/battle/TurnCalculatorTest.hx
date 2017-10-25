package emanadventures.models.battle;

import haxesharp.exceptions.ArgumentException;
using haxesharp.test.Assert;

class TurnCalculatorTest
{
    @Test
    public function constructorThrowsIfEntitiesAreNullOrEmpty()
    {
        Assert.throws(ArgumentException, (_) => new TurnCalculator(null));
        Assert.throws(ArgumentException, (_) => new TurnCalculator( [] ));
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

    // Currently throws. See: https://github.com/nightblade9/haxesharp/issues/10
    // @Test
    public function calculateNextTurnGivesEveryoneATurn()
    {
        var player = new AgileEntity(7);
        var slime1 = new AgileEntity(3);
        var slime2 = new AgileEntity(3);
        var slime3 = new AgileEntity(3);

        var tc = new TurnCalculator([slime3, player, slime1, slime2]);
        var actual = new Array<IBattleEntity>();

        while (actual.length < 4)
        {
            actual.push(tc.calculateNextTurn());
        }

        Assert.that(actual[0], Is.equalTo(player));
        Assert.that(actual[1], Is.equalTo(slime1));
        Assert.that(actual[2], Is.equalTo(slime2));
        Assert.that(actual[3], Is.equalTo(slime3));
    }
}

private class AgileEntity implements IBattleEntity
{
    public var agility(default, null):Int;
    private var id:Int;
    private static var nextId:Int = 1;

    public function new(agility:Int)
    {
        this.id = nextId++;
        this.agility = agility;
    }

    public function toString():String
    {
        return '${this.id}: ${this.agility} agility';
    }
}