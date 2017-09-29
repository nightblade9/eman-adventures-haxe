package emanadventures.generators;

import emanadventures.model.templates.StoryTemplate;
import emanadventures.model.Artifact;
import emanadventures.model.Story;

import haxesharp.random.Random;
import haxesharp.text.Regex;
import haxesharp.exceptions.InvalidOperationException;

/**
Generates a story, givena template and enough data (from repositories).
*/
class StoryGenerator
{
    // Slightly liberal in accepting malformed format, but it accepts pretty much
    // all properly-formatted tokens, so we'll go with this.
    // 
    // Acceptable formats:
    // {Type} eg. {NPC}
    // {Type:Tag} eg. {Antagonist:Beast}
    // {Type:N} eg. {Location::2} (second location)
    // {Type:Tag:N}
    private static inline var TOKEN_REGEX:String = "{([a-z]+):?([a-z]+)?:?(\\d+)?}";
    
    private var seededRandom:Random;

    // Repositories. TODO: convert to JSON
    private var artifactRepository:Array<Artifact> = [
        new Artifact("Legendary Sword", "sword.png"),
        new Artifact("Faith Crystal", "crystal.png"),        
        new Artifact("Dragon Whistle", "dragon-whistle.png")
    ]; 

    public function new(seededRandom:Random)
    {
        // TODO: accept repositories as inputs
        // TODO: auto-discover and wire up repositories
        this.seededRandom = seededRandom;
    }

    public function generate(template:StoryTemplate):Story
    {
        var storyArtifacts = new Array<Artifact>();
        var seenArtifactNumbers = new Map<Int, Artifact>();
        
        var tokens:Array<String> = template.getTokens();
        for (token in tokens)
        {
            var regex = new Regex(TOKEN_REGEX);
            var match = regex.match(token);
            if (match.success)
            {
                var type = match.groups[0]; // eg. Antagonist
                var tag = match.groups[1]; // eg. Beast
                var rawNumber = match.groups[2]; // eg. 2

                var instanceNumber:Int = 0;
                if (rawNumber != "")
                {
                    instanceNumber = Std.parseInt(rawNumber);
                }

                trace('Tokenized: type=${type}, tag=${tag}, #=${instanceNumber}!');

                // TODO: do this in a less terrible way. If we're told to generate
                // an artifact, make sure this is the first time we saw that instance,
                // and make sure we pick a unique artifact.
                if (type == "Artifact" && !seenArtifactNumbers.exists(instanceNumber))
                {
                    var artifact = this.artifactRepository[seededRandom.next(this.artifactRepository.length)];
                    while (storyArtifacts.indexOf(artifact) > -1)
                    {
                        artifact = this.artifactRepository[seededRandom.next(this.artifactRepository.length)];
                    }
                    storyArtifacts.push(artifact);
                    seenArtifactNumbers.set(instanceNumber, artifact);
                }
            }
            else
            {
                throw new InvalidOperationException('${token} doesn\'t match the token-parsing regex');
            }
        }

        return new Story(storyArtifacts);
    }
}