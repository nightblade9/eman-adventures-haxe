import massive.munit.TestSuite;

import emanadventures.model.EventTemplateTest;
import emanadventures.model.WorldTest;
import emanadventures.model.StoryTemplateTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(emanadventures.model.EventTemplateTest);
		add(emanadventures.model.WorldTest);
		add(emanadventures.model.StoryTemplateTest);
	}
}
