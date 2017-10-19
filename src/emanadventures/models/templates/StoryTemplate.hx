package emanadventures.models.templates;

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

     // Event tokens:
    // {Protagonist} means the main player character
    // {Hero} means a player character
    // {Antagonist} means the final villain
    // {Villain} means a significant enemy character
    // {Beast} is a neutral beast, like a dragon.
    // {NPC} is a human NPC of some sort

    // Special tokens:
    // Final Confrontation: the final battle in a special location
    // Epilogue: something to show once the final battle ends

    // The same token, when repeated, refers to the same one instance of that thing.
    // All events must have locations.
    
    // {Token:Tag:N} (tag can be empty, N is if you want two locations: {Location} and {Location::2})
    // TODO: convert to data
    private static var ALL_TEMPLATES:Array<StoryTemplate> =
    [
        // Theme and story: whoever kills a life, killed all humanity; whoever saves one, saved humanity.
        // Here's a villain who's targetting women and children, like Firawn; he needs to be stopped.
        // Specifically, target the weapon he's using.
        new StoryTemplate([
            new EventTemplate("{NPC:Leader} sends {Protagonist} to fight {Villain} at {Location::1} and recover the {Artifact:MultiPart}"),
            new EventTemplate("{Protagonist} discovers {Artifact:MultiPart} en route, in {Location:Remote:2}"),
            new EventTemplate("{Protagonist} meets {NPC} in {Location:Distant:3}, who rebuilds {Artifact}"),
            // Antagonist wants world domination (dunya). Good guy says it will not end well in this life or the next.
            // Antagonist insists, and breaks the artifact.
            new EventTemplate("{Antagonist} ambushes {Protagonist} at {Location::1} and breaks the {Artifact} into two pieces"),
            new EventTemplate("{Protagonist} recovers the first piece in {Location::4}"),
            new EventTemplate("{Protagonist} recovers the second piece in {Location::5}"),
            new EventTemplate("Final Confrontation"),
            new EventTemplate("Epilogue: {Protagonist} returns to {NPC:Leader}, the world is safe once more")
        ]),

        // Theme and story: your mother, your mother, your mother, and then your father
        new StoryTemplate([
            new EventTemplate("{Protagonist} wakes up at {Location::1} to find his mother {NPC:Woman} kidnapped by {Antagonist}"),
            // Protagonist uses self-reminders and du'a to help him when he falls short
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location::2}, he triumphs over {Beast}"),
            // Location 2 is only reachable through location 1. Protagonist unlocks, antagonist steals, the artifact.
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location::3}, and unlocks {Artifact}"),
            // Location 3 is only reachable through location 2; Antagonist needed him to slay the beast.
            // T'was a guardian of the key (artifact).
            // Having found the artifact in location 1, Antagonist is now in a position to unlock it's power ...
            new EventTemplate("{Protagonist} follows {Antagonist} to {Location:Special:4}, where {Antagonist} uses {Artifact} to unlock power!"),
            new EventTemplate("Final Confrontation")            
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