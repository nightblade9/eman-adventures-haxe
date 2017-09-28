import massive.munit.TestSuite;

import emanadventures.model.EventTest;
import emanadventures.model.StoryTemplateTest;
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

		add(emanadventures.model.EventTest);
		add(emanadventures.model.StoryTemplateTest);
		add(emanadventures.model.WorldTest);
	}
}
