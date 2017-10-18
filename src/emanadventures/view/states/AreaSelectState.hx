package emanadventures.view.states;

import flixel.FlxG;
import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class AreaSelectState extends HelixState
{
    private static inline var PADDING:Int = 64;

    // TODO: replace with real classes
    private var knownAreas = [
        { name: "Silver Forest", bgColor: 0xFF999999 },
        { name: "Ice Temple", bgColor: 0xFFaaccee },
        { name: "Cave", bgColor: 0xFF553311 }
    ];

	override public function create():Void
	{
        this.bgColor = FlxColor.BLACK;

        for (i in 0 ... knownAreas.length)
        {
            var x = PADDING + ((i + 1) * 2 * PADDING);

            new HelixSprite("assets/images/area-icon.png").move(x, 150)
            .onClick(function() {
                var area = knownAreas[i];
                FlxG.switchState(new MapState(area.bgColor));
            });
        }
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
    }
}

typedef Area = {
    var name:String;
    var bgColor:FlxColor;
}