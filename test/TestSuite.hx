import massive.munit.TestSuite;

import emanadventures.generators.StoryGeneratorTest;
import emanadventures.io.JsonReaderTest;
import emanadventures.models.ArtifactTest;
import emanadventures.models.templates.EventTemplateTest;
import emanadventures.models.templates.StoryTemplateTest;
import emanadventures.models.WorldTest;

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
		add(emanadventures.models.ArtifactTest);
		add(emanadventures.models.templates.EventTemplateTest);
		add(emanadventures.models.templates.StoryTemplateTest);
		add(emanadventures.models.WorldTest);
	}
}
