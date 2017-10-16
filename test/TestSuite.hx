import massive.munit.TestSuite;

import emanadventures.generators.StoryGeneratorTest;
import emanadventures.io.JsonReaderTest;
import emanadventures.model.ArtifactTest;
import emanadventures.model.templates.EventTemplateTest;
import emanadventures.model.templates.StoryTemplateTest;
import emanadventures.model.WorldTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(emanadventures.generators.StoryGeneratorTest);
		add(emanadventures.io.JsonReaderTest);
		add(emanadventures.model.ArtifactTest);
		add(emanadventures.model.templates.EventTemplateTest);
		add(emanadventures.model.templates.StoryTemplateTest);
		add(emanadventures.model.WorldTest);
	}
}
