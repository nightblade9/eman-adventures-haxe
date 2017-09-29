package emanadventures.model.templates;

import emanadventures.model.templates.StoryTemplate;
import haxesharp.random.Random;
import haxesharp.test.Assert;

@:access(emanadventures.model.templates.StoryTemplate)
class StoryTemplateTest
{
    @Test
    public function generateGeneratesARandomStory()
    {
        var r = new Random();
        var s1 = StoryTemplate.generate(r);
        Assert.that(s1, Is.not(null));
        Assert.that(s1.events, Is.not(null));
        Assert.that(s1.events.length > 0);

        // Make sure there are at least two stories. Object equality doesn't work,
        // so instad, check if the first event is the same. That is unique per-story.
        var s2:StoryTemplate;
        do
        {
            s2 = StoryTemplate.generate(r);
        } while (s2.events[0] == s1.events[0]);
    }

    @Test
    public function getUniqueTokensGetsUniqueTokens()
    {
        var template = new StoryTemplate([
            new EventTemplate("{Protagonist} discovers {Location}"),
            new EventTemplate("{Protagonist} confronts {Antagonist}")            
        ]);

        var actual = template.getUniqueTokens();
        Assert.that(actual.length, Is.equalTo(3));
        Assert.that(actual.filter(function(s) { return s == "{Protagonist}"; }).length == 1);
        Assert.that(actual.filter(function(s) { return s == "{Location}"; }).length == 1);
        Assert.that(actual.filter(function(s) { return s == "{Antagonist}"; }).length == 1);
    }
}