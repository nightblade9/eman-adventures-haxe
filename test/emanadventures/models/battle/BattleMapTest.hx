package emanadventures.models.battle;

import haxesharp.test.Assert;

class BattleMapTest
{
    @Test
    public function isWalkableReturnsFalseIfEntityResidesThere()
    {
        var e = new BattleEntity(13, 7);
        var map = new BattleMap(25, 20);
        map.addEntity(e);

        Assert.that(map.isWalkable(e.x, e.y), Is.equalTo(false));
        // Check adjacencies, and diagonals. Randomly.
        Assert.that(map.isWalkable(e.x - 1, e.y - 1), Is.equalTo(true));
        Assert.that(map.isWalkable(e.x + 1, e.y), Is.equalTo(true));
        Assert.that(map.isWalkable(e.x, e.y - 1), Is.equalTo(true));
        Assert.that(map.isWalkable(e.x - 1, e.y + 1), Is.equalTo(true));
    }
}