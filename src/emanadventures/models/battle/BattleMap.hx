package emanadventures.models.battle;

using haxesharp.collections.Linq;

class BattleMap implements pathfinder.IMap
{
    // Do we really need a grid? ...
    private var entities = new Array<BattleEntity>();

    public var rows( default, null ):Int;
	public var cols( default, null ):Int;

	public function new(tilesWide:Int, tilesHigh:Int)
	{
		cols = tilesWide;
		rows = tilesHigh;
	}
	
	public function isWalkable(tileX:Int, tileY:Int):Bool
	{
		return !entities.any((e) => e.x == tileX && e.y == tileY);
	}

    public function addEntity(e:BattleEntity):Void
    {
        this.entities.push(e);
    }
}