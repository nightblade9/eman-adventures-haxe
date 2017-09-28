package emanadventures.model;

class Event
{
    public var data(default, null):String;

    public function new(data:String)
    {
        this.data = data;
    }
}