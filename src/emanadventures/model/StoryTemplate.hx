package emanadventures.model;

import haxesharp.random.Random;

/**
A "story template." That is, a connected set of event templates.
From the events, we can pick characters, key items, locations, etc.
Put it all together, and you get an actual "story instance."
*/
class StoryTemplate
{
     // Event grammar
    // {Protagonist} means the main player character
    // {Antagonist} means the final villain
    // {Hero} means a player character
    // {Enemy} means a significant enemy character
    // The same token, when repeated, refers to the same one instance of that thing.
    //
    // TODO: convert to data
    private static var ALL_STORIES:Array<StoryTemplate> =
    [
        // S1: the legendary hero, struck down at the height of power, recovers and overcomes the villain
        new StoryTemplate([
            new Event("{NPC:Leader} sends {Protagonist} to fight {Enemy General} and recover the {Artifact:Part}"),
            new Event("{Protagonist} discovers {Artifact:Part} en route, in {Location:Remote}"),
            new Event("{Protagonist} meets {NPC} in a distant land, who rebuilds {Artifact}"),
            new Event("{Antagonist} ambushes {Protagonist} and breaks the {Artifact} into two pieces"),
            new Event("{Protagonist} recovers the first piece in {Location:2}"),
            new Event("{Protagonist} recovers the second piece in {Location:3}"),
            new Event("{Antagonist} confronts {Antagonist}")
        ])
    ];
    
    public var events(default, null):Array<Event>;

    public static function generate(seededRandom:Random):StoryTemplate
    {
        var storyIndex:Int = seededRandom.next(ALL_STORIES.length);
        var storyTemplate:StoryTemplate = ALL_STORIES[storyIndex];
        return storyTemplate;
    }

    public function new(events:Array<Event>)
    {
        this.events = events;
    }
}