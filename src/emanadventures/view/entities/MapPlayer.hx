package emanadventures.view.entities;

import helix.core.HelixSprite;

class MapPlayer extends HelixSprite
{
    private static inline var PLAYER_VELOCITY:Int = 150;
    
    public function new()
    {
        super(null, { width: 48, height: 48, colour: 0xFFffffff});
        this.moveWithKeyboard(PLAYER_VELOCITY);
    }
}