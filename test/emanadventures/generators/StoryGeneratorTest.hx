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
    public function generateGeneratesArtifacts()
    {
        var random = new Random();
        
        var template = new StoryTemplate([
            new EventTemplate("{Protagonist} finds {Artifact}"),
            new EventTemplate("{Protagonist} eats {Artifact}"),
            new EventTemplate("{NPC} eats {Artifact::2}"),
        ]);

        var generator = new StoryGenerator(random);
        var actual:Story = generator.generate(template);

        Assert.that(actual.artifacts.length, Is.equalTo(2));
    }
}