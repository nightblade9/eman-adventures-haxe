package emanadventures.models;

import haxesharp.test.Assert;

class ArtifactTest
{
    @Test
    public function gettersGetConstructorValues()
    {
        var actual = new Artifact("Sword of Hope", "sword.png");
        Assert.that(actual.name, Is.equalTo("Sword of Hope"));
        Assert.that(actual.sprite, Is.equalTo("sword.png"));
    }
}