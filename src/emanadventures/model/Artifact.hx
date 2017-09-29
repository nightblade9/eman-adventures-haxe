package emanadventures.model;

class Artifact
{
    public var name(default, null):String;
    public var sprite(default, null):String;

    public function new(name:String, sprite:String)
    {
        this.name = name;
        this.sprite = sprite;
    }
}