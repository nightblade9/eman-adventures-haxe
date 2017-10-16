package emanadventures.io;

import haxesharp.text.Regex;
import haxesharp.test.Assert;

class JsonReaderTest
{
    @Test
    public function removeCommentsRemovesJavascriptStyleComments()
    {
        var input = "{
            'age': 7, // debug value
            // TODO: delete
            'cheatMode': true
        }
        ";

        var actual = JsonReader.removeComments(input);
        var whitespaceRegex = new Regex("\\s+", "g");
        // Trim whitespace so our test is less flaky
        actual = whitespaceRegex.replace(actual, "");
        Assert.that(actual, Is.equalTo("{'age':7,'cheatMode':true}"));
    }
}