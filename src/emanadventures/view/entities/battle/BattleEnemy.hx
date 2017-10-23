package emanadventures.view.entities.battle;

import helix.core.HelixSprite;

class BattleEnemy extends HelixSprite
{
    public function new(jsonConfig:Dynamic)
    {
        super(null, { width: 48, height: 48, colour: 0xFF008800 });
        this.text('${jsonConfig.health}/${jsonConfig.health}');
    }
}