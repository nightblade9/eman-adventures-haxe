package emanadventures.states;

import flixel.util.FlxColor;
import helix.core.HelixState;

class HouseState extends HelixState
{
	override public function create():Void
	{
		super.create();
		this.bgColor = FlxColor.BROWN;
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
	}
}
