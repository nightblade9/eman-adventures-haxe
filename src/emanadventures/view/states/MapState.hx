package emanadventures.view.states;

import emanadventures.model.MapArea;
import emanadventures.view.entities.MapPlayer;
import emanadventures.view.states.HomeState;
import flixel.FlxG;
import haxesharp.random.Random;
import helix.core.HelixSprite;
import helix.core.HelixState;

class MapState extends HelixState
{
    private var player:MapPlayer;
    private var key:HelixSprite;
    private var successor:MapArea;

    public function new(area:MapArea, successor:MapArea)
    {
        super();
        this.bgColor = area.bgColor;
        this.successor = successor;
    }

    override public function create():Void
    {
        super.create();

        this.player = new MapPlayer();
        // Start in the top-middle of the room
		player.move((this.width - player.width) / 2, player.height);

        if (this.successor != null)
        {
            this.key = new HelixSprite("assets/images/key.png");
            var r = new Random();
            var x = new Random().next(0, Std.int(this.width - key.width));
            // Somewhere below the player
            var y = r.next(Std.int(player.y + player.height), Std.int(this.height - key.height));
            key.move(x, y);

            player.collide(key, function(p, k) {
                this.successor.isDiscovered = true;
                FlxG.switchState(new HomeState());
            });
        }
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}