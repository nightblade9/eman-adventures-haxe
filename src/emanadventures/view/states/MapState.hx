package emanadventures.view.states;

import emanadventures.model.MapArea;
import emanadventures.view.entities.MapPlayer;
import helix.core.HelixSprite;
import helix.core.HelixState;

class MapState extends HelixState
{
    private var player:MapPlayer;
    private var key:HelixSprite;

    public function new(area:MapArea, nextArea:MapArea)
    {
        super();
        this.bgColor = area.bgColor;
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