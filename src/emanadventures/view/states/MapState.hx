package emanadventures.view.states;

import emanadventures.view.entities.MapPlayer;
import flixel.util.FlxColor;
import helix.core.HelixState;

class MapState extends HelixState
{
    private var player:MapPlayer;

    public function new(bgColor:FlxColor)
    {
        super();
        this.bgColor = bgColor;
    }

    override public function create():Void
    {
        super.create();
        
        this.player = new MapPlayer();
        // Start in the middle of the room
		player.move((this.width - player.width) / 2, (this.height - player.height) / 2);
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}