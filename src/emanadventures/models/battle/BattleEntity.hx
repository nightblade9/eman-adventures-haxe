package emanadventures.models.battle;

class BattleEntity
{
    public var x(default, default):Int = 0;
    public var y(default, default):Int = 0;

    public function new(x:Int, y:Int)
    {
        this.x = x;
        this.y = y;
    }
}