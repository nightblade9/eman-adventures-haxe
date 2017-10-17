package emanadventures.states;

import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class AreaSelectState extends HelixState
{
	override public function create():Void
	{
        this.bgColor = FlxColor.BLACK;
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
    }
}