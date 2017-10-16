package emanadventures.io;

import haxe.Json;
import haxesharp.text.Regex;

class JsonReader
{
    private static inline var commentRegex:String = "//.*";

    public static function readJsonAsset(filename:String):Dynamic
    {
        var text = openfl.Assets.getText(filename);
        text = removeComments(text);
        return Json.parse(text);
    }

    public static function removeComments(json:String):String
    {
        return new Regex(commentRegex, "g").replace(json, "");
    }
}