package emanadventures.states;

import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class AreaSelectState extends HelixState
{
    private static inline var PADDING:Int = 64;
    private var knownAreas = ["Silver Forest", "Ice Temple", "Cave"];

	override public function create():Void
	{
        this.bgColor = FlxColor.BLACK;

        for (i in 0 ... knownAreas.length)
        {
            var x = PADDING + ((i + 1) * 2 * PADDING);

            new HelixSprite("assets/images/area-icon.png").move(x, 150)
            .onClick(function() {
                trace("Clicked on " + i);
            });
        }
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
    }
}