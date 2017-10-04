package emanadventures.model.templates;

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
    // {Hero} means a player character
    // {Antagonist} means the final villain
    // {Villain} means a significant enemy character
    // The same token, when repeated, refers to the same one instance of that thing.
    //
    // {Token:Tag:N} (tag can be empty, N is if you want two locations: {Location} and {Location::2})
    // TODO: convert to data
    private static var ALL_TEMPLATES:Array<StoryTemplate> =
    [
        // TODO: these probably need to be distilled down into further events
        // eg. Fight(Protagonist, Villan); Discover(Item, Location); Travel(Home); Destroyed(Village)
        // From there, we know specific stuff (which villain? what text do we show in that dialog?)

        // Legendary hero finds and builds/recovers the artifact which he uses to confront and defeat the antagonist.
        new StoryTemplate([
            new EventTemplate("{NPC:Leader} sends {Protagonist} to fight {Villain} and recover the {Artifact:MultiPart}"),
            new EventTemplate("{Protagonist} discovers {Artifact:MultiPart} en route, in {Location:Remote}"),
            new EventTemplate("{Protagonist} meets {NPC} in a distant land, who rebuilds {Artifact}"),
            // Antagonist wants world domination (dunya). Good guy says it will not end well in this life or the next.
            // Antagonist insists, and breaks the artifact.
            new EventTemplate("{Antagonist} ambushes {Protagonist} and breaks the {Artifact} into two pieces"),
            new EventTemplate("{Protagonist} recovers the first piece in {Location::2}"),
            new EventTemplate("{Protagonist} recovers the second piece in {Location::3}"),
            new EventTemplate("{Protagonist} confronts {Antagonist}")
            // Epilogue: Protagonist returns to {NPC:Leader}, the world is safe once more
        ]),

        // Hero's family member gets kidnapped; he follows, unwittingly unlocking a power for the antagonist.
        new StoryTemplate([
            new EventTemplate("{Protagonist} wakes up to find his family member {NPC} kidnapped by {Antagonist}"),
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location::1}, where he finds {Artifact}"),
            // Protagonist uses self-reminders and du'a to help him when he falls short
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location::2}, where his faith triumphs over {Villain:Beast}"),
            // Location 3 is only reachable through location 2; Antagonist needed him to slay the beast.
            // Having found the artifact in location 1, Antagonist is now in a position to unlock it's power ...
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location::3}, where {Antagonist} unlocks {Artifact}"),            
            new EventTemplate("{Protagonist} confronts {Antagonist}")
            // Epilogue: Antagonist is confused why he lost. Protagonist says something about: the power of eman and du'a.
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

    public function createStory(seededRandom:Random):Void
    {
        
    }

    public function getTokens():Array<String>
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