package emanadventures.states;

import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class HouseState extends HelixState
{
	override public function create():Void
	{
		super.create();
		this.bgColor = FlxColor.BROWN;

		var player = new HelixSprite("assets/images/player.png").moveWithKeyboard(100);
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
	}
}
