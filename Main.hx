package;

import emanadventures.models.World;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		new World(); // Initialize world instance.
		addChild(new FlxGame(0, 0, emanadventures.view.states.HomeState, 1, 60, 60, true));
	}
}
