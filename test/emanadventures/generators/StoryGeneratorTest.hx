package emanadventures.generators;

import emanadventures.generators.StoryGenerator;
import emanadventures.model.Story;
import emanadventures.model.templates.EventTemplate;
import emanadventures.model.templates.StoryTemplate;

import haxesharp.random.Random;
import haxesharp.test.Assert;

class StoryGeneratorTest
{
    @Test
    public function generateGeneratesArtifactsWithNumberAndTags()
    {
        var random = new Random();
        
        var template = new StoryTemplate([
            new EventTemplate("{Protagonist} finds {Artifact}"), // initial instance
            new EventTemplate("{Protagonist:Two} eats {Artifact}"), // same instance
            new EventTemplate("{NPC} eats {Artifact::2}"), // second instance
            new EventTemplate("{NPC} eats {Artifact:Small:3}"), // third instance with tag
        ]);

        var generator = new StoryGenerator(random);
        var actual:Story = generator.generate(template);

        Assert.that(actual.artifacts.length, Is.equalTo(3));
        
        // They all have different names
        var a1 = actual.artifacts[0];
        var a2 = actual.artifacts[1];
        var a3 = actual.artifacts[2];
        
        Assert.that(a1.name, Is.not(a2.name));
        Assert.that(a1.name, Is.not(a3.name));
        Assert.that(a2.name, Is.not(a3.name));
    }
}