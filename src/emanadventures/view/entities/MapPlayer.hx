package emanadventures.view.entities;

import helix.core.HelixSprite;

class MapPlayer extends HelixSprite
{
    private static inline var PLAYER_VELOCITY:Int = 150;
    
    public function new()
    {
        super("assets/images/player.png");
        this.moveWithKeyboard(PLAYER_VELOCITY);
    }
}