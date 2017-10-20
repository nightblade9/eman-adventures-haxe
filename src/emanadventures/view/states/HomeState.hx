package emanadventures.view.states;

import emanadventures.io.JsonReader;
import emanadventures.view.entities.MapPlayer;
import emanadventures.view.states.MapAreaSelectState;
import flixel.FlxG;
import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class HomeState extends HelixState
{
	private var player:MapPlayer;
	private var exit:Dynamic; // JSON

	override public function create():Void
	{
		super.create();
		this.bgColor = FlxColor.BROWN;

		this.player = new MapPlayer();
		// Start in the middle of the room
		player.move((this.width - player.width) / 2, (this.height - player.height) / 2);
		var json = JsonReader.readJsonAsset("assets/data/home.json");
		var wallSizes:Array<Array<Int>> = json.walls;

		for (wallSize in wallSizes)
		{
			var x = wallSize[0];
			var y = wallSize[1];
			var width = wallSize[2];
			var height = wallSize[3];

			var wall = new HelixSprite(null, { width: width, height: height, colour: 0xFFff8800 }).collisionImmovable().move(x, y);
			player.collideResolve(wall);
		}

		this.exit = json.exit;
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);

		// Exit is not a real sprite. It's just a location. AABB collision check.
		if (player.x >= exit.x && player.x <= exit.x + exit.width && 
			player.y >= exit.y && player.y <= exit.y + exit.height)
		{
			FlxG.switchState(new MapAreaSelectState());
		}
	}
}
