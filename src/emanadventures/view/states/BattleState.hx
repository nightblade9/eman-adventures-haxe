package emanadventures.view.states;

import emanadventures.io.JsonReader;
import emanadventures.models.battle.IBattleEntity;
import emanadventures.models.battle.TurnCalculator;
import emanadventures.view.entities.battle.BattleEnemy;
import emanadventures.view.entities.battle.BattlePlayer;
import flixel.util.FlxColor;
using haxesharp.collections.Linq;
import helix.core.HelixState;

class BattleState extends HelixState
{
    private var PLAYER_HEALTH:Int = 50;
    private var PLAYER_AGILITY:Int = 5;
    private var ENEMIES:Array<String> = ["Slime", "Slime", "Slime"];
    private var whoseTurn:IBattleEntity;
    private var turnCalculator:TurnCalculator;

    override public function create():Void
    {
        super.create();
        this.bgColor = FlxColor.BLACK;
        var json = JsonReader.readJsonAsset("assets/data/enemies.json");
        var enemies:Array<Dynamic> = json.enemies;
        var entities = new Array<IBattleEntity>();

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
            
            entities.push(sprite.entity);
        }

        var playerSprite = new BattlePlayer(PLAYER_HEALTH, PLAYER_AGILITY);
        playerSprite.x = this.width / 4;
        playerSprite.y = (this.height - playerSprite.height) / 2;
        entities.push(playerSprite.entity);

        this.turnCalculator = new TurnCalculator(entities);
        // Currently throws. See: https://github.com/nightblade9/haxesharp/issues/10
        // trace('Next: ${this.turnCalculator.calculateNextTurn()}');
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}