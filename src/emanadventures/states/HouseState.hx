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

		var player = new HelixSprite("assets/images/player.png").moveWithKeyboard(100).move(200, 200);
		var text = openfl.Assets.getText("assets/data/home.json");

		// Remove comments
        var regex = new EReg("//.*", "g");
		text = regex.replace(text, "");

		var json = haxe.Json.parse(text);
		var wallSizes:Array<Array<Int>> = json.walls;

		for (wallSize in wallSizes)
		{
			var x = wallSize[0];
			var y = wallSize[1];
			var orientation = wallSize[2];

			var wall = new HelixSprite('assets/images/wall-${orientation}.png').collisionImmovable().move(x, y);
			player.collideResolve(wall);
		}
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
	}
}
