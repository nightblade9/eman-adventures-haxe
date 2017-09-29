package emanadventures.model;

import haxesharp.test.Assert;

class EventTemplateTest
{
    @Test
    public function constructorSetsData()
    {
        var expectedData = "{Protagonist} confronts {Antagonist}";
        var expected = new EventTemplate(expectedData);
        Assert.that(expected.data, Is.equalTo(expectedData));
    }
}