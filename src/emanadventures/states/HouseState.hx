package emanadventures.states;

import emanadventures.io.JsonReader;
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
		var json = JsonReader.readJsonAsset("assets/data/home.json");
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
