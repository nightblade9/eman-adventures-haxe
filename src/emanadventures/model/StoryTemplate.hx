package emanadventures.model;

import haxesharp.random.Random;
import haxesharp.text.Regex;

/**
A "story template." That is, a connected set of event templates.
From the events, we can pick characters, key items, locations, etc.
Put it all together, and you get an actual "story instance."
*/
class StoryTemplate
{
    private static inline var TOKEN_REGEX:String = "({[a-zA-Z0-9:]+})";

     // Event grammar
    // {Protagonist} means the main player character
    // {Antagonist} means the final villain
    // {Hero} means a player character
    // {Enemy} means a significant enemy character
    // The same token, when repeated, refers to the same one instance of that thing.
    //
    // {Token:Tag:N} (tag can be empty, N is if you want two locations: {Location} and {Location::2})
    // TODO: convert to data
    private static var ALL_TEMPLATES:Array<StoryTemplate> =
    [
        // S1: the legendary hero, struck down at the height of power, recovers and overcomes the villain
        new StoryTemplate([
            new EventTemplate("{NPC:Leader} sends {Protagonist} to fight {Enemy General} and recover the {Artifact:Part}"),
            new EventTemplate("{Protagonist} discovers {Artifact:Part} en route, in {Location:Remote}"),
            new EventTemplate("{Protagonist} meets {NPC} in a distant land, who rebuilds {Artifact}"),
            new EventTemplate("{Antagonist} ambushes {Protagonist} and breaks the {Artifact} into two pieces"),
            new EventTemplate("{Protagonist} recovers the first piece in {Location::2}"),
            new EventTemplate("{Protagonist} recovers the second piece in {Location::3}"),
            new EventTemplate("{Antagonist} confronts {Antagonist}")
        ]),

        // S2: the hero, born in a prosperous powerful kingdom founded on uncontrollable power, seeks revenge.
        new StoryTemplate([
            new EventTemplate("{Protagonist}'s {Kingdom} discovers a powerful magic of unknown origin from {Antagonist:Beast}"),
            new EventTemplate("{Protagonist} walks in on the {NPC:Leader} as they harness the uncontrollable power and gets flung to a far-off land"),
            new EventTemplate("{NPC:Warrior} discovers {Protagonist} and takes him in as a student"),
            new EventTemplate("{Protagonist} trains, becomes a powerful warrior, and leaves {NPC:Warrior}"),
            new EventTemplate("{Protagonist} returns home to discover {Antagonist:Beast} destroyed their {Kingdom}"),
            new EventTemplate("{Protagonist} discovers how to find/summon {Antagonist:Beast}"),
            new EventTemplate("{Protagonist} confronts {Antagonist:Beast}")
        ])
    ];
    
    public var events(default, null):Array<EventTemplate>;

    public static function generate(seededRandom:Random):StoryTemplate
    {
        var storyIndex:Int = seededRandom.next(ALL_TEMPLATES.length);
        var storyTemplate:StoryTemplate = ALL_TEMPLATES[storyIndex];
        return storyTemplate;
    }

    public function new(events:Array<EventTemplate>)
    {
        this.events = events;
    }

    public function getUniqueTokens():Array<String>
    {
        var toReturn = new Array<String>();

        for (event in this.events)
        {
            var eventTokens = Regex.matches(event.data, TOKEN_REGEX);
            for (token in eventTokens)
            {
                if (toReturn.indexOf(token) == -1)
                {
                    toReturn.push(token);
                }
            }
        }
        return toReturn;
    }
}