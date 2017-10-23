package emanadventures.view.states;

import emanadventures.io.JsonReader;
import emanadventures.view.entities.battle.BattleEnemy;
import emanadventures.view.entities.battle.BattlePlayer;
import flixel.util.FlxColor;
using haxesharp.collections.Linq;
import helix.core.HelixState;

class BattleState extends HelixState
{
    private var PLAYER_HEALTH:Int = 50;
    private var ENEMIES:Array<String> = ["Slime", "Slime", "Slime"];

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

            var sprite = new BattleEnemy(config);
            sprite.x = (3 * this.width / 4) + (64 * (i % 3));
            sprite.y = (this.height / 3) + (64 * (i / 3));
        }

        var playerSprite = new BattlePlayer(PLAYER_HEALTH);
        playerSprite.x = this.width / 4;
        playerSprite.y = (this.height - playerSprite.height) / 2;
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}