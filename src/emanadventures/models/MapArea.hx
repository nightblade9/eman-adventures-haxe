package emanadventures.models;

class MapArea
{
    public var name(default, null):String;
    public var bgColor(default, null):Int;
    public var isDiscovered(default, default):Bool = false;

    public function new(name:String, bgColor:Int, isDiscovered:Bool = false)
    {
        this.name = name;
        this.bgColor = bgColor;
        this.isDiscovered = isDiscovered;
    }
}