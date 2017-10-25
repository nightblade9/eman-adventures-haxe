package emanadventures.view.entities.battle;

import emanadventures.models.battle.BattleEntity;
import helix.core.HelixSprite;
using helix.core.HelixSpriteFluentApi;

class BattleEnemy extends HelixSprite
{
    private static var NEXT_ID:Int = 1;
    private var id:Int;
    private var data:BattleEntity;

    public function new(jsonConfig:Dynamic)
    {
        super(null, { width: 48, height: 48, colour: 0xFF008800 });
        this.id = NEXT_ID++;
        this.data = new BattleEntity(jsonConfig.health, jsonConfig.agility);
        this.updateDisplay();
    }

    private function updateDisplay():Void
    {
        this.text('${data.currentHealth}/${data.totalHealth}\nE${this.id}');        
    }
}