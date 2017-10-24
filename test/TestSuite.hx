import massive.munit.TestSuite;

import emanadventures.models.battle.TurnCalculatorTest;
import emanadventures.models.battle.BattleEntityTest;
import emanadventures.models.components.HealthComponentTest;
import emanadventures.models.ArtifactTest;
import emanadventures.models.WorldTest;
import emanadventures.models.templates.EventTemplateTest;
import emanadventures.models.templates.StoryTemplateTest;
import emanadventures.io.JsonReaderTest;
import emanadventures.generators.StoryGeneratorTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(emanadventures.models.battle.TurnCalculatorTest);
		add(emanadventures.models.battle.BattleEntityTest);
		add(emanadventures.models.components.HealthComponentTest);
		add(emanadventures.models.ArtifactTest);
		add(emanadventures.models.WorldTest);
		add(emanadventures.models.templates.EventTemplateTest);
		add(emanadventures.models.templates.StoryTemplateTest);
		add(emanadventures.io.JsonReaderTest);
		add(emanadventures.generators.StoryGeneratorTest);
	}
}
