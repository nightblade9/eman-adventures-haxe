package emanadventures.model;

import emanadventures.model.StoryTemplate;
import haxesharp.random.Random;
import haxesharp.test.Assert;

class StoryTemplateTest
{
    @Test
    public function generateGeneratesARandomStory()
    {
        var story = StoryTemplate.generate(new Random());
        Assert.that(story, Is.not(null));
        Assert.that(story.events, Is.not(null));
        Assert.that(story.events.length > 0);
        // TODO: add an assert when we have more than one story
    }
}