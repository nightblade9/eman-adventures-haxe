package emanadventures.states;

import flixel.util.FlxColor;
import helix.core.HelixSprite;
import helix.core.HelixState;

class MapState extends HelixState
{
    public function new(bgColor:FlxColor)
    {
        super();
        this.bgColor = bgColor;
    }

    override public function create():Void
    {
        super.create();
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}