package emanadventures.view.states;

import helix.core.HelixState;

class GridBattleState extends HelixState
{
    override public function create():Void
    {
        super.create();
        this.bgColor = FlxColor.BLACK;
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
    }
}