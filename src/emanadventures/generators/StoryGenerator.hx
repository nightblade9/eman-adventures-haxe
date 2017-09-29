package emanadventures.generators;

import emanadventures.model.templates.StoryTemplate;
import emanadventures.model.Story;

/**
Generates a story, givena template and enough data (from repositories).
*/
class StoryGenerator
{
    public function new()
    {
        // TODO: accept repositories as inputs
    }

    public function generate(template:StoryTemplate):Story
    {
        var tokens:Array<String> = template.getTokens();
        return new Story();
    }
}