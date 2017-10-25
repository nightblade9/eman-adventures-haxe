package emanadventures.view.entities.battle;

import helix.core.HelixSprite;
using helix.core.HelixSpriteFluentApi;

class BattlePlayer extends HelixSprite
{
    public function new(totalHealth:Int)
    {
        super(null, { width: 48, height: 48, colour: 0xFFffffff });
        this.text('${totalHealth}/${totalHealth}', 0xFFff0000);
    }
}