package emanadventures.view.entities.battle;

import emanadventures.models.battle.BattleEntity;
import helix.core.HelixSprite;
using helix.core.HelixSpriteFluentApi;

class BattlePlayer extends HelixSprite
{
    public var entity(default, null):BattleEntity;

    public function new(totalHealth:Int, agility:Int)
    {
        super(null, { width: 48, height: 48, colour: 0xFFffffff });
        this.entity = new BattleEntity(totalHealth, agility);
        this.text('${totalHealth}/${totalHealth}', 0xFFff0000);
    }
}