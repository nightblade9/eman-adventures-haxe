package emanadventures.model;

class EventTemplate
{
    public var data(default, null):String;

    public function new(data:String)
    {
        this.data = data;
    }
}