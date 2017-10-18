package emanadventures.view.states;

import emanadventures.model.MapArea;
import flixel.FlxG;
import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class MapAreaSelectState extends HelixState
{
    private static inline var PADDING:Int = 64;

    // TODO: replace with real classes
    private var worldMapAreas = [
        new MapArea("Silver Forest", 0xFF999999, true),
        new MapArea("Ice Temple", 0xFFaaccee),
        new MapArea("Cave", 0xFF553311)
    ];

	override public function create():Void
	{
        this.bgColor = FlxColor.BLACK;

        for (i in 0 ... worldMapAreas.length)
        {
            var mapArea = worldMapAreas[i];

            if (mapArea.isDiscovered)
            {
                var x = PADDING + ((i + 1) * 2 * PADDING);

                new HelixSprite("assets/images/area-icon.png").move(x, 150)
                .onClick(function() {
                    var nextMapArea = i < worldMapAreas.length - 1 ? worldMapAreas[i + 1] : null;
                    FlxG.switchState(new MapState(mapArea, nextMapArea));
                });
            }
        }
	}

	override public function update(elapsedSeconds:Float):Void
	{
		super.update(elapsedSeconds);
    }
}

