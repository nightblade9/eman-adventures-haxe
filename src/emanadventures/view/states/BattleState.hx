package emanadventures.view.states;

import emanadventures.io.JsonReader;
import flixel.util.FlxColor;
using haxesharp.collections.Linq;
import helix.core.HelixSprite;
import helix.core.HelixState;

class BattleState extends HelixState
{
    private var ENEMIES = ["Slime", "Slime", "Slime"];

    override public function create():Void
    {
        super.create();
        this.bgColor = FlxColor.BLACK;
        var json = JsonReader.readJsonAsset("assets/data/enemies.json");
        var enemies:Array<Dynamic> = json.enemies;

        // enemies
        for (i in 0 ... ENEMIES.length)
        {
            var enemy = ENEMIES[i];
            // TODO: refactor to use haxesharp.collections.Linq.first.
            var config:Dynamic = enemies.first((s) => s.name == enemy);
            if (config == null) { throw 'NO CONFIG FOR ${enemy}?!?!'; }

            var sprite = new HelixSprite(null, { width: 48, height: 48, colour: 0xFF008800 });
            sprite.x = (3 * this.width / 4) + (64 * (i % 3));
            sprite.y = (this.height / 3) + (64 * (i / 3));
            sprite.text('${config.health}/${config.health}');
        }

        var playerSprite = new HelixSprite(null, { width: 48, height: 48, colour: 0xFFffffff });
        playerSprite.x = this.width / 4;
        playerSprite.y = (this.height - playerSprite.height) / 2;
        playerSprite.text('50/50', 0xFFff0000);
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}