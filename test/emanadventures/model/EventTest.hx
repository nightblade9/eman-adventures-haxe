package emanadventures.model;

import haxesharp.test.Assert;

class EventTest
{
    @Test
    public function constructorSetsData()
    {
        var expectedData = "{Protagonist} confronts {Antagonist}";
        var expected = new Event(expectedData);
        Assert.that(expected.data, Is.equalTo(expectedData));
    }
}