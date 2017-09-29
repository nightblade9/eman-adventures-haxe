package emanadventures.model;

/**
An actual story, with concrete characters, artifacts, events, etc.
*/
class Story
{
    public var artifacts(default, null):Array<Artifact>;

    public function new(artifacts:Array<Artifact>)
    {
        this.artifacts = artifacts;
    }
}