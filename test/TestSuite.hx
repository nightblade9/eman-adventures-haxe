import massive.munit.TestSuite;

import emanadventures.io.JsonReaderTest;
import emanadventures.generators.StoryGeneratorTest;
import emanadventures.model.ArtifactTest;
import emanadventures.model.WorldTest;
import emanadventures.model.templates.EventTemplateTest;
import emanadventures.model.templates.StoryTemplateTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(emanadventures.io.JsonReaderTest);
		add(emanadventures.generators.StoryGeneratorTest);
		add(emanadventures.model.ArtifactTest);
		add(emanadventures.model.WorldTest);
		add(emanadventures.model.templates.EventTemplateTest);
		add(emanadventures.model.templates.StoryTemplateTest);
	}
}
