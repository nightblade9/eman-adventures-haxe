package emanadventures.view.states;

import emanadventures.models.MapArea;
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

        var r = new Random();

        this.generateKey(r, player);
        this.generateEnemies(r);
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }

    private function generateKey(r:Random, player:MapPlayer):Void
    {
        if (this.successor != null)
        {
            this.key = new HelixSprite(null, { width: 32, height: 16, colour: 0xFFffff00 });
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

    private function generateEnemies(r:Random):Void
    {
        var enemy = new HelixSprite(null, { width: 32, height: 32, colour: 0xFFff0000 });
        var x = new Random().next(0, Std.int(this.width - key.width));
        // Somewhere below the player
        var y = r.next(Std.int(player.y + player.height), Std.int(this.height - enemy.height));
        // TODO: make sure that space is unoccupied by key
        enemy.move(x, y);

        player.collide(enemy, function(p, e) {
            FlxG.switchState(new GridBattleState());
        });
    }
}