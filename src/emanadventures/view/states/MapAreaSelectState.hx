package emanadventures.view.states;

import emanadventures.models.World;
import flixel.FlxG;
import flixel.util.FlxColor;
import helix.core.HelixState;
import helix.core.HelixSprite;

class MapAreaSelectState extends HelixState
{
    private static inline var PADDING:Int = 64;
    
	override public function create():Void
	{
        this.bgColor = FlxColor.BLACK;
        var world = World.lastInstance;

        for (i in 0 ... world.mapAreas.length)
        {
            var mapArea = world.mapAreas[i];

            if (mapArea.isDiscovered)
            {
                var x = PADDING + ((i + 1) * 2 * PADDING);

                new HelixSprite("assets/images/area-icon.png").move(x, 150)
                .onClick(function() {
                    var nextMapArea = i < world.mapAreas.length - 1 ? world.mapAreas[i + 1] : null;
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

